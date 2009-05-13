io.stderr:write('\n::: Entered rc.lua: ', os.time(), ' time_t :::\n\n')
-- Standard awesome libraries
require("awful")
require("beautiful")
require("naughty")

-- Extra Libraries
require("wicked")
require("markup")
require("calendar")
require("battery")
require("widgets")

-- {{{1 Variable definitions
tags                = {}
statusbar           = {}
promptbox           = {}
taglist             = {}
tasklist            = {}
layoutbox           = {}
user                = {}
user.keys           = {}
user.ckeys          = {}
user.apps           = {}
user.audio          = {}
user.home           = os.getenv("HOME")

user.time_format    = '%H:%M'
user.date_format    = '%A %d %B'
user.red            = '#ff87ff'
user.yellow         = '#c4a000'
user.green          = '#5faf5f'
user.blue           = '#5f87d7'

user.win_info = 'xmessage -c "$(xprop | '
                ..'awk -F \'"\' \'/^WM_CLASS/ '
                ..'{ printf("%s:%s:",$4,$2) }; /^WM_NAME/ '
                ..'{ printf("%s\\n",$2) }\')"'

user.apps.term          = 'term-wrapper'
user.apps.browser       = 'firefox -new-tab'
user.apps.screensaver   = 'xscreensaver-command -lock'
user.apps.editor        = os.getenv("EDITOR") or "nano"
user.apps.editor_cmd    = user.apps.term .. " -e " .. user.apps.editor

user.audio.Up           = 'amixer set PCM 3%+'
user.audio.Down         = 'amixer set PCM 3%-'
user.audio.Mute         = 'amixer set Master toggle'
user.audio.Stop         = 'mpc stop'

-- Themes define colours, icons, and wallpapers
user.theme_path         = user.home .. "/.config/awesome/theme"

if user.theme_path then
    beautiful.init(user.theme_path)
else
    beautiful.init('/usr/local/share/awesome/themes/default/theme')
end

-- Default modkey.
modkey = "Mod4"

-- Table of layouts to cover with awful.layout.inc, order matters.
layouts =
{
    awful.layout.suit.tile,
    awful.layout.suit.tile.left,
    awful.layout.suit.tile.bottom,
    awful.layout.suit.tile.top,
    awful.layout.suit.fair,
--    awful.layout.suit.fair.horizontal,
    awful.layout.suit.max,
--    awful.layout.suit.max.fullscreen,
--    awful.layout.suit.magnifier,
    awful.layout.suit.floating
}

-- Consolidated application rules
user.rules = {
    [{ class = 'MPlayer'        }] = { float = true         },
    [{ class = 'gimp'           }] = { float = true         },
    [{ class = 'Tomboy'         }] = { float = true         },
    [{ class = 'Thunderbird-bin'}] = { screen = 1, tag = 2  },
    [{ class = 'Vmplayer'       }] = { screen = 2, tag = 9  },
}

-- Define if we want to use titlebar on all applications.
use_titlebar = false

-- {{{1 Tags
-- Define tags table.
tags = {}
for s = 1, screen.count() do
    -- Each screen has its own tag table.
    tags[s] = {}
    -- Create 9 tags per screen.
    for tagnumber = 1, 9 do
        tags[s][tagnumber] = tag(" "..tagnumber)
        -- Add tags to screen one by one
        tags[s][tagnumber].screen = s
        awful.layout.set(layouts[1], tags[s][tagnumber])
        awful.tag.setproperty(tags[s][tagnumber],"mwfact",0.58)
    end
    -- I'm sure you want to see at least one tag.
    tags[s][1].selected = true
end

-- {{{1 Menu

-- Submenu
user.awesomemenu = 
{
   { "manual"       , user.apps.term .. " -e man awesome"                                     },
   { "edit config"  , user.apps.editor_cmd .. " " .. awful.util.getdir("config") .. "/rc.lua" },
   { "restart"      , awesome.restart                                                         },
   { "quit"         , awesome.quit                                                            },
}

-- Mainmenu
user.mainmenu = awful.menu.new(
{
    items = { 
        { "awesome"     , user.awesomemenu, beautiful.awesome_icon  },
        { "terminal"    , user.apps.term                            },
    }
})

-- {{{1 Wibox

-- Custom widgets section

-- Upcomming events widget
palbox = widget({ type = "textbox", align = "right", name = "palbox"})
wicked.register( palbox, function (fmt) return {system('~/bin/upcomming')} end, " $1 ", 120)

-- Top todo item widget
todobox = widget({ type = "textbox", align = "right", name = "todobox"})
wicked.register( todobox, function (fmt) return {system('~/bin/todo-check')} end, " $1 ", 1)

-- Music player widget
mpdbox = widget({ type = "textbox", align = "left", name = "mpdbox"})
wicked.register( mpdbox, wicked.widgets.mpd, ' $1')

-- Volume widget
volbox = widget({ type = "textbox", align = "right", name = "volbox"})
volbox.text = volume_info('#5f87d7')

-- Temperature widget
tempwidget = widget({ type = "textbox", align = "right"})
tempwidget.text = temperature_info('#5faf5f')

-- Battery widget
batterywidget = widget({ type = "textbox", align = "right", name = "batterywidget"})
battery.init(batterywidget)

-- End Custom widgets section

-- Create a textbox widget for the version/date display
clockbox = widget({ type = "textbox", align = "right" })
clockbox.text           = "<b><small> " .. AWESOME_RELEASE .. " </small></b>"
clockbox.mouse_enter    = function() add_calendar(0) end 
clockbox.mouse_leave    = remove_calendar
clockbox:buttons(
{
    button({ }, 4, function () add_calendar(-1) end),
    button({ }, 5, function () add_calendar( 1) end),
})

-- Create a laucher widget and a main menu
launcher = awful.widget.launcher(
{
    image = image(beautiful.awesome_icon),
    menu = user.mainmenu,
    align = "right"
})

-- Create a systray
systray = widget({ type = "systray", align = "right" })

-- Define the main set of widgets
taglist.buttons = 
{ 
    button({        }, 1    , awful.tag.viewonly                                ),
    button({ modkey }, 1    , awful.client.movetotag                            ),
    button({        }, 3    , function (tag) tag.selected = not tag.selected end),
    button({ modkey }, 3    , awful.client.toggletag                            ),
    button({        }, 4    , awful.tag.viewnext                                ),
    button({        }, 5    , awful.tag.viewprev                                ),
}

tasklist.buttons = 
{
    button({        }, 1    , function (c) client.focus = c; c:raise() end),
    button({        }, 3    , 
        function () 
            if instance then instance:hide() end 
            instance = awful.menu.clients({ width=250 })
        end),
    button({        }, 4    , function () awful.client.focus.byidx( 1) end),
    button({        }, 5    , function () awful.client.focus.byidx(-1) end),
}


for s = 1, screen.count() do
    -- Create a promptbox for each screen
    promptbox[s] = widget({ type = "textbox", align = "left" })

    -- Create an imagebox widget which will contains an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    layoutbox[s] = widget({ type = "imagebox", align = "left" })
    layoutbox[s]:buttons(
    {
        button({        }, 1    , function () awful.layout.inc(layouts,  1) end),
        button({        }, 3    , function () awful.layout.inc(layouts, -1) end),
        button({        }, 4    , function () awful.layout.inc(layouts,  1) end),
        button({        }, 5    , function () awful.layout.inc(layouts, -1) end),
    })

    -- Create a taglist widget
    taglist[s] = awful.widget.taglist.new(s, awful.widget.taglist.label.all, taglist.buttons)

    -- Create a tasklist widget
    tasklist[s] = awful.widget.tasklist.new(
        function(c)
            return awful.widget.tasklist.label.currenttags(c, s)
        end,
        tasklist.buttons
    )

    -- Create the statusbar, or wibox, and set it's properties
    statusbar[s] = wibox(
    {
        position = "top",
        fg = beautiful.fg_normal,
        bg = beautiful.bg_normal,
    })

    -- Add widgets to the wibox - order matters
    statusbar[s].widgets = 
    {
        taglist[s],
        promptbox[s],
        layoutbox[s],
        --tasklist[s],
        s == 1 and mpdbox           or nil,
        s == 1 and palbox           or nil,
        s == 1 and widget_divider_r or nil,
        s == 2 and todobox          or nil,
        s == 1 and volbox           or nil,
        s == 1 and widget_divider_r or nil,
        s == 1 and batterywidget    or nil,
        s == 1 and widget_divider_r or nil,
        s == 1 and tempwidget       or nil,
        s == 1 and widget_divider_r or nil,
        s == 1 and clockbox         or nil,
        s == 1 and widget_spacer_r  or nil,
        launcher                          ,
        s == 1 and systray          or nil,
    }

    -- Add it to each screen
    statusbar[s].screen = s
end

-- {{{1 Mouse bindings
root.buttons(
{
    button({        }, 3    , function () user.mainmenu:toggle() end),
    button({        }, 4    , awful.tag.viewnext                    ),
    button({        }, 5    , awful.tag.viewprev                    ),
})

-- {{{1 Key bindings -- modified a little
user.keys =
{
    -- Standard programs
    key({ modkey,           }, "Return" , function () awful.util.spawn(user.apps.term)  end),
    key({ modkey,           }, "Up"     , function () awful.util.spawn(user.audio.Up)   end),
    key({ modkey,           }, "Down"   , function () awful.util.spawn(user.audio.Down) end),
    key({ modkey,           }, "End"    , function () awful.util.spawn(user.audio.Mute) end),
    key({ modkey,           }, "s"      , function () awful.util.spawn(user.audio.Stop) end),
    key({ modkey, "Shift"   }, "i"      , function () awful.util.spawn(user.win_info)   end),
    key({ "Control"         }, "6"      , function () awful.util.spawn(user.apps.screensaver) end),

    -- Tag navigation
    key({ modkey,           }, "Left"   , awful.tag.viewprev       ),
    key({ modkey,           }, "Right"  , awful.tag.viewnext       ),
    key({ modkey,           }, "Escape" , awful.tag.history.restore),

    -- Client focusing
    key({ modkey,           }, "j"      , function () awful.client.focus.byidx( 1)  end),
    key({ modkey,           }, "k"      , function () awful.client.focus.byidx(-1)  end),
    key({ modkey,           }, "Tab"    , function () awful.client.focus.history.previous() end),

    -- Screen focusing
    key({ modkey,           }, "h"      , function () awful.screen.focus( 1)        end),
    key({ modkey,           }, "l"      , function () awful.screen.focus(-1)        end),

    -- Client manipulation
    key({ modkey, "Shift"   }, "j"      , function () awful.client.swap.byidx( 1)   end),
    key({ modkey, "Shift"   }, "k"      , function () awful.client.swap.byidx(-1)   end),
    key({ modkey,           }, "u"      , awful.client.urgent.jumpto                   ),

    -- Awesome control
    key({ modkey, "Control" }, "r"      , awesome.restart                              ),
    key({ modkey, "Shift"   }, "q"      , awesome.quit                                 ),
    key({ modkey,           }, "space"  , function () awful.layout.inc(layouts,  1) end),
    key({ modkey, "Shift"   }, "space"  , function () awful.layout.inc(layouts, -1) end),

    -- Layout manipulation
    key({ modkey, "Control" }, "j"      , function () awful.tag.incmwfact( 0.05)    end),
    key({ modkey, "Control" }, "k"      , function () awful.tag.incmwfact(-0.05)    end),
    key({ modkey, "Shift"   }, "Up"     , function () awful.client.incwfact( 0.05)  end),
    key({ modkey, "Shift"   }, "Down"   , function () awful.client.incwfact(-0.05)  end),

    key({ modkey, "Shift"   }, "h"      , function () awful.tag.incnmaster( 1)      end),
    key({ modkey, "Shift"   }, "l"      , function () awful.tag.incnmaster(-1)      end),
    key({ modkey, "Control" }, "h"      , function () awful.tag.incncol( 1)         end),
    key({ modkey, "Control" }, "l"      , function () awful.tag.incncol(-1)         end),

    -- Prompts
    key({ modkey            }, "p"      ,
        function ()
            awful.prompt.run({ prompt = markup.fg(user.yellow, " >> ") },
            promptbox[mouse.screen],
            awful.util.spawn, awful.completion.bash,
            awful.util.getdir("cache") .. "/history")
        end),

    key({ modkey            }, "g"      ,
        function ()
            awful.prompt.run({ prompt = markup.fg("#5fafff", "Google: ") },
            promptbox[mouse.screen],
            function (command) awful.util.spawn(
                "firefox -new-tab 'http://www.google.com/search?ie=UTF-8&oe=UTF-8&sourceid=navclient&gfns=1&q="
                .. command .. "'") end) 
        end),

    key({ modkey            }, "F1"     ,
        function ()
            awful.prompt.run({ prompt = markup.fg("#ff87ff", " >> ") },
            promptbox[mouse.screen],
            awful.util.spawn, awful.completion.bash,
            awful.util.getdir("cache") .. "/history")
        end),

    key({ modkey            }, "F4"     ,
        function ()
            awful.prompt.run({ prompt = "Run Lua code: " },
            promptbox[mouse.screen],
            awful.util.eval, awful.prompt.bash,
            awful.util.getdir("cache") .. "/history_eval")
        end),
}

-- Client awful tagging: this is useful to tag some clients and then do stuff like move to tag on them
user.ckeys =
{
    key({ modkey,           }, "f"      , function (c) c.fullscreen = not c.fullscreen  end),
    key({ modkey, "Control" }, "f"      , function (c) c:raise() end),
    key({ modkey, "Shift"   }, "c"      , function (c) c:kill()                         end),
    key({ modkey, "Control" }, "space"  , awful.client.floating.toggle                     ),
    key({ modkey, "Control" }, "Return" , function (c) c:swap(awful.client.getmaster()) end),
    key({ modkey,           }, "o"      , awful.client.movetoscreen                        ),
    key({ modkey, "Shift"   }, "r"      , function (c) c:redraw()                       end),
    key({ modkey,           }, "t"      , awful.client.togglemarked                        ),
    key({ modkey,           }, "m"      , 
        function (c)
            c.maximized_horizontal = not c.maximized_horizontal
            c.maximized_vertical   = not c.maximized_vertical
        end),
}

-- Compute the maximum number of digit we need, limited to 9
keynumber = 0
for s = 1, screen.count() do
    keynumber = math.min(9, math.max(#tags[s], keynumber));
end

for i = 1, keynumber do
    table.insert(user.keys,
        key({ modkey            }, i    ,
            function ()
                local screen = mouse.screen
                if tags[screen][i] then
                    awful.tag.viewonly(tags[screen][i])
                end
            end))
    table.insert(user.keys,
        key({ modkey, "Control" }, i    ,
            function ()
                local screen = mouse.screen
                if tags[screen][i] then
                    tags[screen][i].selected = not tags[screen][i].selected
                end
            end))
    table.insert(user.keys,
        key({ modkey, "Shift"   }, i    ,
            function ()
                if client.focus and tags[client.focus.screen][i] then
                    awful.client.movetotag(tags[client.focus.screen][i])
                end
            end))
    table.insert(user.keys,
        key({ modkey, "Control", "Shift" }, i,
            function ()
                if client.focus and tags[client.focus.screen][i] then
                    awful.client.toggletag(tags[client.focus.screen][i])
                end
            end))
end


for i = 1, keynumber do
    table.insert(user.keys, key({ modkey, "Shift" }, "F" .. i,
                 function ()
                     local screen = mouse.screen
                     if tags[screen][i] then
                         for k, c in pairs(awful.client.getmarked()) do
                             awful.client.movetotag(tags[screen][i], c)
                         end
                     end
                 end))
end

-- Set keys
root.keys(user.keys)

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
    -- If we are not managing this application at startup,
    -- move it to the screen where the mouse is.
    -- We only do it for filtered windows (i.e. no dock, etc).
    if not startup and awful.client.focus.filter(c) then
        c.screen = mouse.screen
    end

    if use_titlebar then
        -- Add a titlebar
        awful.titlebar.add(c, { modkey = modkey })
    end
    -- Add mouse bindings
    c:buttons(
    {
        button({        }, 1    , function (c) client.focus = c; c:raise() end),
        button({ modkey }, 1    , awful.mouse.client.move                     ),
        button({ modkey }, 3    , awful.mouse.client.resize                   ),
    })
    -- New client may not receive focus
    -- if they're not focusable, so set border anyway.
    c.border_width = beautiful.border_width
    c.border_color = beautiful.border_normal

    -- Do this after tag mapping, so you don't see it on the wrong tag for a split second.
    client.focus = c

    -- Set key bindings
    c:keys(user.ckeys)

    -- Set the windows at the slave,
    -- i.e. put it at the end of others instead of setting it master.
    awful.client.setslave(c)

    -- Honor size hints: if you want to drop the gaps between windows, set this to false.
    c.size_hints_honor = false

    -------------------------------------------------------------------------------------
    -- 1 = class, 2 = instance, 3 = title, 4 = screen, 5 = tag, 6 = floating
    local bestmatch, isfloat, isscreen, istag
    bestmatch = 0
    for match, apply in pairs(user.rules) do
        local x = 0
        if match['class']    and c.class    and c.class == match['class']                   then x = x + 1 end
        if match['instance'] and c.instance and c.instance == match['instance']             then x = x + 1 end
        if match['title']    and c.name     and string.match(c.name, match['title']) ~= nil then x = x + 1 end
        if x > bestmatch then
            isscreen    = apply['screen']
            istag       = apply['tag']
            isfloat     = apply['float']
            bestmatch   = x
        end
    end

    if isfloat ~= nil and isfloat ~= awful.client.floating.get(c) then
        awful.client.floating.set(c, isfloat)
    end

    if isscreen ~= nil and istag ~= nil then
        awful.client.movetotag(tags[isscreen][istag], c)
        c.screen = isscreen
        c.tag    = istag
    else
        if isscreen ~= nil then
            awful.client.movetoscreen(c, isscreen)
            c.screen = isscreen
        end
        if istag ~= nil then
            awful.client.movetotag(tags[mouse.screen][istag], c)
            c.tag = istag
        end
    end
    -------------------------------------------------------------------------------------
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

-- Hook called every 5 seconds
awful.hooks.timer.register(5, function ()
    tempwidget.text = temperature_info(user.green)
    volbox.text = volume_info(user.blue)
end)

-- Hook called every minute
awful.hooks.timer.register(60, function ()
    clockbox.text = clock_info(user.yellow, user.date_format, user.time_format)
    battery.info()
end)

-- vim: set ts=4 sw=4 sta et:
