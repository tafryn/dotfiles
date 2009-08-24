io.stderr:write('\n::: Entered rc.lua: ', os.time(), ' time_t :::\n\n')

--{{{1 Tables

local tags      = { }
local statusbar = { }
local promptbox = { }
local taglist   = { }
local tasklist  = { }
local layoutbox = { }
local settings  = { }

-- {{{1 Imports

-- Standard awesome library
require("awful")
require("beautiful")
require("naughty")

-- Extra libraries
require("wicked")
require("markup")
require("calendar")
require("battery")
require("widgets")

-- {{{1 Variable definitions

settings.modkey         = 'Mod4'
settings.time_format    = '%H:%M'
settings.date_format    = '%A %d %B'
settings.red            = '#ff87ff'
settings.yellow         = '#c4a000'
settings.green          = '#5faf5f'
settings.blue           = '#5f87d7'
settings.use_titlebar   = false

-- Applications
settings.terminal       = 'term-wrapper'
settings.browser        = 'firefox -new-tab'
settings.screensaver    = 'xscreensaver-command -lock'
settings.editor         = os.getenv('EDITOR') or 'nano'
settings.editor_cmd     = settings.terminal .. ' -e ' .. settings.editor

settings.audio_up       = 'amixer set Master 3%+'
settings.audio_down     = 'amixer set Master 3%-'
settings.audio_mute     = 'amixer set Master toggle'
settings.audio_stop     = 'mpc stop'

--settings.win_info = 'xmessage -c "$(xprop | awk -F \" \'/^WM_CLASS/ { printf("%s:%s:",$4,$2) }; /^WM_NAME/ { printf("%s\\n",$2) }\')"'

-- Load Theme
settings.theme_path     = os.getenv('HOME') .. "/.config/awesome/theme.lua"

if settings.theme_path then
    beautiful.init(settings.theme_path)
else
    beautiful.init('/usr/share/awesome/themes/default/theme.lua')
end

-- For clean reading later on
modkey = settings.modkey

-- Table of layouts to cover with awful.layout.inc, order matters.
settings.layouts =
{
    awful.layout.suit.tile,
    awful.layout.suit.tile.bottom,
    awful.layout.suit.max,
    awful.layout.suit.magnifier,
    awful.layout.suit.floating
}

settings.app_rules =
{  -- Class             Instance    Title       Screen  Tag     Floating
    { 'Firefox'         , nil       , nil       , 1     , 1     , false },
    { 'Firefox'         , 'Download', nil       , 1     , 1     , true  },
    { 'Thunderbird-bin' , nil       , nil       , 2     , 1     , false },
    { 'Vmplayer'        , nil       , nil       , 1     , 9     , false },
    { 'MPlayer'         , nil       , nil       , nil   , nil   , true  },
    { 'gimp'            , nil       , nil       , nil   , nil   , true  },
    { 'Tomboy'          , nil       , nil       , nil   , nil   , true  },
}

settings.tag_properties =
{
    { name = '1'    , layout = settings.layouts[2]  , mwfact = 0.58 },
    { name = '2'    , layout = settings.layouts[2]  , mwfact = 0.58 },
    { name = '3'    , layout = settings.layouts[2]  , mwfact = 0.58 },
    { name = '4'    , layout = settings.layouts[2]  , mwfact = 0.58 },
    { name = '5'    , layout = settings.layouts[2]  , mwfact = 0.58 },
    { name = '6'    , layout = settings.layouts[2]  , mwfact = 0.58 },
    { name = '7'    , layout = settings.layouts[2]  , mwfact = 0.58 },
    { name = '8'    , layout = settings.layouts[2]  , mwfact = 0.58 },
    { name = '9'    , layout = settings.layouts[2]  , mwfact = 0.58 },
}

-- {{{1 Tags

for s = 1, screen.count() do
    tags[s] = {}
    for i, v in ipairs(settings.tag_properties) do
        tags[s][i] = tag(v.name)
        tags[s][i].screen = s
        awful.tag.setproperty(tags[s][i], 'layout'  , v.layout)
        awful.tag.setproperty(tags[s][i], 'mwfact'  , v.mwfact)
        awful.tag.setproperty(tags[s][i], 'nmaster' , v.nmaster)
        awful.tag.setproperty(tags[s][i], 'ncols'   , v.ncols)
        awful.tag.setproperty(tags[s][i], 'icon'    , v.icon)
    end
    tags[s][1].selected = true
end

-- {{{1 Menu

settings.awesomemenu = 
{
   { "manual"       , settings.terminal .. " -e man awesome"                                },
   { "edit config"  , settings.editor_cmd .. " " .. awful.util.getdir("config") .. "/rc.lua"},
   { "restart"      , awesome.restart                                                       },
   { "quit"         , awesome.quit                                                          },
}

settings.mainmenu = awful.menu.new(
{
    items = { 
        { "awesome"         , settings.awesomemenu, beautiful.awesome_icon  },
        { "open terminal"   , settings.terminal                             },
    }
})


-- {{{1 Widgets 

systray  = widget({ type = 'systray' , align = 'right'   })
palbox   = widget({ type = 'textbox' , align = 'left'    })
todobox  = widget({ type = 'textbox' , align = 'right'   })
mpdbox   = widget({ type = 'textbox' , align = 'right'   })
volbox   = widget({ type = 'textbox' , align = 'right'   })
tempbox  = widget({ type = 'textbox' , align = 'right'   })
battbox  = widget({ type = 'textbox' , align = 'right'   })
clockbox = widget({ type = 'textbox' , align = 'right'   })

clockbox.text = "<b><small> " .. awesome.release .. " </small></b>"
clockbox.mouse_enter    = function() add_calendar(0) end 
clockbox.mouse_leave    = remove_calendar
clockbox:buttons(
{
    button({ }, 4, function () add_calendar(-1) end),
    button({ }, 5, function () add_calendar( 1) end),
})

launcher = awful.widget.launcher({ image = image(beautiful.awesome_icon),
                                   menu = settings.mainmenu, align = 'right' })

taglist.buttons = awful.util.table.join(
    awful.button({        }, 1  , awful.tag.viewonly                                ),
    awful.button({ modkey }, 1  , awful.client.movetotag                            ),
    awful.button({        }, 3  , function (tag) tag.selected = not tag.selected end),
    awful.button({ modkey }, 3  , awful.client.toggletag                            ),
    awful.button({        }, 4  , awful.tag.viewnext                                ),
    awful.button({        }, 5  , awful.tag.viewprev                                )
)

tasklist.buttons = awful.util.table.join(
    awful.button({ }, 1, function (c)
        if not c:isvisible() then awful.tag.viewonly(c:tags()[1]) end
        client.focus = c
        c:raise()
    end),
    awful.button({ }, 3, function ()
        if instance then
            instance:hide()
            instance = nil
        else
            instance = awful.menu.clients({ width=250 })
        end
    end),
    awful.button({ }, 4, function ()
        awful.client.focus.byidx(1)
        if client.focus then client.focus:raise() end
    end),
    awful.button({ }, 5, function ()
        awful.client.focus.byidx(-1)
        if client.focus then client.focus:raise() end
    end)
)

for s = 1, screen.count() do
    promptbox[s] = awful.widget.prompt({ align = "left" })

    layoutbox[s] = widget({ type = "imagebox", align = "left" })
    layoutbox[s]:buttons(awful.util.table.join(
                           awful.button({ }, 1, function () awful.layout.inc(settings.layouts, 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(settings.layouts, -1) end)))

    taglist[s] = awful.widget.taglist(s, awful.widget.taglist.label.all, taglist.buttons)

    tasklist[s] = awful.widget.tasklist(function(c)
                                          return awful.widget.tasklist.label.currenttags(c, s)
                                        end, tasklist.buttons)
    statusbar[s] =  wibox(
    { 
        position = "top",
        --height = '14',
        fg = beautiful.fg_normal, 
        bg = beautiful.bg_normal 
    })
    -- Add widgets to the statusbar - order matters
    statusbar[s].widgets = 
    { 
        taglist[s],
        promptbox[s],
        layoutbox[s],
        --tasklist[s],
        s == 1 and palbox       or nil,
        s == 1 and todobox      or nil,
        s == 2 and mpdbox       or nil,
        s == 2 and volbox       or nil,
        s == 2 and tempbox      or nil,
        s == 2 and battbox      or nil,
        s == 2 and clockbox     or nil,
        launcher,
        s == 1 and systray or nil 
    }
    statusbar[s].screen = s
end

-- {{{1 Bindings

root.buttons(awful.util.table.join(
    awful.button({ }, 3, function () settings.mainmenu:toggle() end),
    awful.button({ }, 4, awful.tag.viewnext),
    awful.button({ }, 5, awful.tag.viewprev)
))

local globalkeys = awful.util.table.join(
    -- Standard programs
    awful.key({ modkey,           }, "Return", function () awful.util.spawn(settings.terminal) end),
    awful.key({ modkey,           }, "Up"    , function () awful.util.spawn(settings.audio_up) end),
    awful.key({ modkey,           }, "Down"  , function () awful.util.spawn(settings.audio_down) end),
    awful.key({ modkey,           }, "End"   , function () awful.util.spawn(settings.audio_mute) end),
    awful.key({ modkey,           }, "s"     , function () awful.util.spawn(settings.audio_stop) end),
    awful.key({ modkey, "Shift"   }, "u"     , function () awful.util.spawn(settings.win_info) end),
    awful.key({ "Control"         }, "6"     , function () awful.util.spawn(settings.screensaver) end),

    -- Tag navigation
    awful.key({ modkey,           }, "Left"  , awful.tag.viewprev       ),
    awful.key({ modkey,           }, "Right" , awful.tag.viewnext       ),
    awful.key({ modkey,           }, "Escape", awful.tag.history.restore),

    -- Client focusing
    awful.key({ modkey,           }, "u"     , awful.client.urgent.jumpto),
    awful.key({ modkey,           }, "h"     , function () awful.client.focus.byidx( 1) end),
    awful.key({ modkey,           }, "t"     , function () awful.client.focus.byidx(-1) end),
    awful.key({ modkey,           }, "Tab"   , function () awful.client.focus.history.previous() end),
    awful.key({ modkey,           }, "a"     , function () 
        if client.focus then client.focus:raise() end 
    end),
    
    --Screen focusing
    awful.key({ modkey,           }, "d"     , function () focus_by_idx(2)       end),
    awful.key({ modkey,           }, "n"     , function () focus_by_idx(1)       end),

    --Client manipulation
    awful.key({ modkey, "Shift"   }, "h"     , function () awful.client.swap.byidx(  1) end),
    awful.key({ modkey, "Shift"   }, "t"     , function () awful.client.swap.byidx( -1) end),

    -- Awesome control
    awful.key({ modkey, "Control" }, "r"     , awesome.restart                          ),
    awful.key({ modkey, "Shift"   }, "q"     , awesome.quit                             ),
    awful.key({ modkey,           }, "space" , function () awful.layout.inc(settings.layouts,  1) end),
    awful.key({ modkey, "Shift"   }, "space" , function () awful.layout.inc(settings.layouts, -1) end),
    awful.key({ modkey,           }, "w"     , function () settings.mainmenu:toggle()   end),

    -- Layout manipulation
    awful.key({ modkey, "Control" }, "h"    , function () awful.tag.incmwfact( 0.05)    end),
    awful.key({ modkey, "Control" }, "t"    , function () awful.tag.incmwfact(-0.05)    end),
    awful.key({ modkey, "Shift"   }, "Up"   , function () awful.client.incwfact( 0.05)  end),
    awful.key({ modkey, "Shift"   }, "Down" , function () awful.client.incwfact(-0.05)  end),

    awful.key({ modkey, "Shift"   }, "d"     , function () awful.tag.incnmaster( 1)     end),
    awful.key({ modkey, "Shift"   }, "n"     , function () awful.tag.incnmaster(-1)     end),
    awful.key({ modkey, "Control" }, "d"     , function () awful.tag.incncol( 1)        end),
    awful.key({ modkey, "Control" }, "n"     , function () awful.tag.incncol(-1)        end),

    -- Prompt
    awful.key({ modkey            }, "r"     , function () promptbox[mouse.screen]:run() end),

    awful.key({ modkey            }, "q"     ,
              function ()
                  awful.prompt.run({ prompt = "Run Lua code: " },
                  promptbox[mouse.screen].widget,
                  awful.util.eval, nil,
                  awful.util.getdir("cache") .. "/history_eval")
              end),

    awful.key({ modkey            }, "g"     ,
        function ()
            awful.prompt.run({ prompt = markup.fg("#5fafff", "Google: ") },
            promptbox[mouse.screen],
            function (command) awful.util.spawn(
                "firefox -new-tab 'http://www.google.com/search?ie=UTF-8&oe=UTF-8&sourceid=navclient&gfns=1&q="
                .. command .. "'") end) 
        end)

)

-- Client awful tagging: this is useful to tag some clients and then do stuff like move to tag on them
local clientkeys = awful.util.table.join(
    awful.key({ modkey,           }, "f"     , function (c) c.fullscreen = not c.fullscreen  end),
    awful.key({ modkey, "Shift"   }, "c"     , function (c) c:kill()                         end),
    awful.key({ modkey, "Control" }, "space" , awful.client.floating.toggle                     ),
    awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end),
    awful.key({ modkey,           }, "o"     , awful.client.movetoscreen                        ),
    awful.key({ modkey, "Shift"   }, "r"     , function (c) c:redraw()                       end),
    awful.key({ modkey            }, "t"     , awful.client.togglemarked),
    awful.key({ modkey,           }, "m"     ,
        function (c)
            c.maximized_horizontal = not c.maximized_horizontal
            c.maximized_vertical   = not c.maximized_vertical
        end)
)

-- Compute the maximum number of digit we need, limited to 9
keynumber = 0
for s = 1, screen.count() do
   keynumber = math.min(9, math.max(#tags[s], keynumber));
end

for i = 1, keynumber do
    globalkeys = awful.util.table.join(globalkeys,
        awful.key({ modkey }, i,
                  function ()
                        local screen = mouse.screen
                        if tags[screen][i] then
                            awful.tag.viewonly(tags[screen][i])
                        end
                  end),
        awful.key({ modkey, "Control" }, i,
                  function ()
                      local screen = mouse.screen
                      if tags[screen][i] then
                          tags[screen][i].selected = not tags[screen][i].selected
                      end
                  end),
        awful.key({ modkey, "Shift" }, i,
                  function ()
                      if client.focus and tags[client.focus.screen][i] then
                          awful.client.movetotag(tags[client.focus.screen][i])
                      end
                  end),
        awful.key({ modkey, "Control", "Shift" }, i,
                  function ()
                      if client.focus and tags[client.focus.screen][i] then
                          awful.client.toggletag(tags[client.focus.screen][i])
                      end
                  end),
        awful.key({ modkey, "Shift" }, "F" .. i,
                  function ()
                      local screen = mouse.screen
                      if tags[screen][i] then
                          for k, c in pairs(awful.client.getmarked()) do
                              awful.client.movetotag(tags[screen][i], c)
                          end
                      end
                   end))
end

root.keys(globalkeys)

-- {{{1 Hooks
-- Hook function to execute when focusing a client.
awful.hooks.focus.register(function (c)
    if not awful.client.ismarked(c) then
        c.border_color = beautiful.border_focus
    end
end)

-- Hook function to execute when unfocusing a client.
awful.hooks.unfocus.register(function (c)
    if not awful.client.ismarked(c) then
        c.border_color = beautiful.border_normal
    end
end)

-- Hook function to execute when marking a client
awful.hooks.marked.register(function (c)
    c.border_color = beautiful.border_marked
end)

-- Hook function to execute when unmarking a client.
awful.hooks.unmarked.register(function (c)
    c.border_color = beautiful.border_focus
end)

-- Hook function to execute when the mouse enters a client.
awful.hooks.mouse_enter.register(function (c)
    -- Sloppy focus, but disabled for magnifier layout
    if awful.layout.get(c.screen) ~= awful.layout.suit.magnifier
        and awful.client.focus.filter(c) then
        client.focus = c
    end
end)

-- Hook function to execute when a new client appears.
awful.hooks.manage.register(function (c, startup)
    if not startup and awful.client.focus.filter(c) then
        c.screen = mouse.screen
    end

    -- Add mouse bindings
    c:buttons(awful.util.table.join(
        awful.button({ }, 1, function (c) client.focus = c; c:raise() end),
        awful.button({ modkey }, 1, awful.mouse.client.move),
        awful.button({ modkey }, 3, awful.mouse.client.resize)
    ))
    
    -- New client may not receive focus
    -- if they're not focusable, so set border anyway.
    c.border_width = beautiful.border_width
    c.border_color = beautiful.border_normal

    -- Check application->screen/tag mappings and floating state.
    local target_screen, target_tag, target_float
    for index, rule in pairs(settings.app_rules) do
        if (    ((rule[1] == nil) or (c.class    and c.class    == rule[1]))
            and ((rule[2] == nil) or (c.instance and c.instance == rule[2]))
            and ((rule[3] == nil) or (c.name     and string.find(c.name, rule[3], 1, true)))) then
            target_screen = rule[4]
            target_tag    = rule[5]
            target_float  = rule[6]
        end
    end

    if target_float then 
        awful.client.floating.set(c, target_float) 
    end
    if target_screen then
        c.screen = target_screen
        awful.client.movetotag(tags[target_screen][target_tag], c)
    end

    -- Do this after tag mapping, so you don't see it on the wrong tag for a split second.
    client.focus = c

    -- Set key bindings
    c:keys(clientkeys)

    -- Set the windows at the slave,
    -- i.e. put it at the end of others instead of setting it master.
    awful.client.setslave(c)

    --awful.placement.no_overlap(c)
    awful.placement.no_offscreen(c)

    -- Honor size hints: if you want to drop the gaps between windows, set this to false.
    c.size_hints_honor = false
end)

-- Hook function to execute when arranging the screen.
-- (tag switch, new client, etc)
awful.hooks.arrange.register(function (screen)
    local layout = awful.layout.getname(awful.layout.get(screen))
    if layout and beautiful["layout_" ..layout] then
        layoutbox[screen].image = image(beautiful["layout_" .. layout])
    else
        layoutbox[screen].image = nil
    end

    -- Give focus to the latest client in history if no window has focus
    -- or if the current window is a desktop or a dock one.
    if not client.focus then
        local c = awful.client.focus.history.get(screen, 0)
        if c then client.focus = c end
    end
end)

-- Run once
battery.init(battbox)


-- Hook called every 1 seconds
awful.hooks.timer.register(1, function ()
    tempbox.text = " " .. temperature_info(settings.green) .. " "
end)

-- Hook called every 5 seconds
awful.hooks.timer.register(5, function ()
    volbox.text = " " .. volume_info(settings.blue) .. " "
end)

-- Hook called every minute
awful.hooks.timer.register(60, function ()
    clockbox.text = clock_info(settings.yellow, settings.date_format, settings.time_format) .. " "
    battery.info()
    palbox.text = " " .. system('~/bin/upcomming') .. " "
    todobox.text = " " .. system('~/bin/todo-check') .. " "
end)


-- vim: set ts=4 sw=4 sta et foldmethod=marker:
