io.stderr:write('\n+++ Entered rc.lua: ', os.time(), ' time_t +++\n\n')

-- {{{1 Tables

local settings      = { }
local tags          = { }
local layouts       = { }
local menus         = { }
local taglists      = { }
local promptboxes   = { }
local tasklists     = { }
local layoutboxes   = { }
local statusbars    = { }

-- {{{1 Imports

-- Standard awesome library
require("awful")
require("awful.autofocus")
require("awful.rules")
-- Theme handling library
require("beautiful")
-- Notification library
require("naughty")

-- User libraries
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
settings.editor         = os.getenv("EDITOR") or "nano"
settings.editor_cmd     = settings.terminal .. ' -e ' .. settings.editor

settings.audio_up       = 'amixer set Master 3%+'
settings.audio_down     = 'amixer set Master 3%-'
settings.audio_mute     = 'amixer set Master toggle'
settings.audio_stop     = 'mpc stop'

-- Themes define colours, icons, and wallpapers
settings.theme_path     = os.getenv('HOME') .. "/.config/awesome/theme.lua"

if settings.theme_path then
    beautiful.init(settings.theme_path)
else
    beautiful.init("/usr/share/awesome/themes/default/theme.lua")
end

-- For clean reading later on.
modkey = settings.modkey

-- Table of layouts to cover with awful.layout.inc, order matters.
layouts =
{
    awful.layout.suit.tile,
    awful.layout.suit.tile.bottom,
    awful.layout.suit.max,
    awful.layout.suit.magnifier,
    awful.layout.suit.floating
}

tags.setup = {
    { name = '1'    , layout = layouts[2]   , mwfact = 0.58 },
    { name = '2'    , layout = layouts[2]   , mwfact = 0.58 },
    { name = '3'    , layout = layouts[2]   , mwfact = 0.58 },
    { name = '4'    , layout = layouts[2]   , mwfact = 0.58 },
    { name = '5'    , layout = layouts[2]   , mwfact = 0.58 },
    { name = '6'    , layout = layouts[2]   , mwfact = 0.58 },
    { name = '7'    , layout = layouts[2]   , mwfact = 0.58 },
    { name = '8'    , layout = layouts[2]   , mwfact = 0.58 },
    { name = '9'    , layout = layouts[2]   , mwfact = 0.58 },
}

-- {{{1 Tags
-- Define a tag table which hold all screen tags.
for s = 1, screen.count() do
    -- Each screen has its own tag table.
    tags[s] = { }
    for i, t in ipairs(tags.setup) do
        tags[s][i] = tag({ name = t.name })
        tags[s][i].screen = s
        awful.tag.setproperty(tags[s][i], "layout", t.layout)
        awful.tag.setproperty(tags[s][i], "mwfact", t.mwfact)
    end
    tags[s][1].selected = true
end

-- {{{1 Rules
awful.rules.rules = {
    -- All clients will match this rule.
    { rule = { },
      properties = { border_width = beautiful.border_width,
                     border_color = beautiful.border_normal,
                     focus = true,
                     keys = clientkeys,
                     buttons = clientbuttons } },
    { rule = { class = "Firefox" }        , properties = { tag = tags[screen.count()][1] } },
    { rule = { class = "Thunderbird-bin" }, properties = { tag = tags[2][1] } },
    { rule = { class = "Vmplayer" }       , properties = { tag = tags[screen.count()][9] } },
    { rule = { class = "MPlayer" }        , properties = { floating = true } },
    { rule = { class = "Tomboy" }         , properties = { floating = true } },
    { rule = { class = "gimp" }           , properties = { floating = true } },
}

-- {{{1 Menu

menus.awesome = {
   { "manual"       , settings.terminal .. " -e man awesome"                                },
   { "edit config"  , settings.editor_cmd .. " " .. awful.util.getdir("config") .. "/rc.lua"},
   { "restart"      , awesome.restart                                                       },
   { "quit"         , awesome.quit                                                          },
}

menus.main = awful.menu(
{ 
    items = { 
        { "awesome"         , menus.awesome, beautiful.awesome_icon },
        { "open terminal"   , settings.terminal                     },
    }
})

menus.launcher = awful.widget.launcher({ image = image(beautiful.awesome_icon), menu = menus.main })

-- {{{1 Widgets

local spacer    = widget({ type = "textbox"})
local separator = widget({ type = "textbox"})
spacer.text = " "
separator.text = "|"

-- Create widgets
--clockbox = awful.widget.textclock({ align = "right" })
systray  = widget({ type = "systray" })
clockbox = widget({ type = "textbox" })
palbox   = widget({ type = "textbox" })
todobox  = widget({ type = "textbox" })
volbox   = widget({ type = "textbox" })
tempbox  = widget({ type = "textbox" })
battbox  = widget({ type = "textbox" })
palbox.text = "pal"
todobox.text = "todo"
volbox.text = "vol"
tempbox.text = "temp"
battbox.text = "batt"

battery.init(battbox)

everysecond = timer { timeout = 1 }
everysecond:add_signal("timeout", 
    function () 
        tempbox.text = " " .. temperature_info(settings.green) .. " "
    end)
everysecond:start()

everyfiveseconds = timer { timeout = 5 }
everyfiveseconds:add_signal("timeout", 
    function () 
        volbox.text = " " .. volume_info(settings.blue) .. " "
    end)
everyfiveseconds:start()

everyminute = timer { timeout = 60 }
everyminute:add_signal("timeout", 
    function () 
        clockbox.text = clock_info(settings.yellow, settings.date_format, settings.time_format) .. " "
        battery.info()
        palbox.text = " " .. system('~/bin/upcomming') .. " "
        todobox.text = " " .. system('~/bin/todo-check') .. " "
    end)
everyminute:start()


taglists.buttons = awful.util.table.join(
    awful.button({        }, 1  , awful.tag.viewonly),
    awful.button({ modkey }, 1  , awful.client.movetotag),
    awful.button({        }, 3  , awful.tag.viewtoggle),
    awful.button({ modkey }, 3  , awful.client.toggletag),
    awful.button({        }, 4  , awful.tag.viewprev),
    awful.button({        }, 5  , awful.tag.viewnext)
)

tasklists.buttons = awful.util.table.join(
    awful.button({ }, 1, function (c)
        if not c:isvisible() then
            awful.tag.viewonly(c:tags()[1])
        end
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

-- Create a wibox for each screen and add it
for s = 1, screen.count() do
    -- Create a promptbox for each screen
    promptboxes[s] = awful.widget.prompt({ layout = awful.widget.layout.horizontal.leftright })
    -- Create an imagebox widget which will contains an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    layoutboxes[s] = awful.widget.layoutbox(s)
    layoutboxes[s]:buttons(awful.util.table.join(
                           awful.button({ }, 1, function () awful.layout.inc(layouts, 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(layouts, -1) end),
                           awful.button({ }, 4, function () awful.layout.inc(layouts, 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(layouts, -1) end)))
    -- Create a taglist widget
    taglists[s] = awful.widget.taglist(s, awful.widget.taglist.label.all, taglists.buttons)

    -- Create a tasklist widget
    tasklists[s] = awful.widget.tasklist(function(c)
                                              return awful.widget.tasklist.label.currenttags(c, s)
                                          end, tasklists.buttons)

    -- Create the wibox
    statusbars[s] = awful.wibox({ position = "top", screen = s })
    -- Add widgets to the wibox - order matters
    statusbars[s].widgets = {
        {
            menus.launcher,
            taglists[s],
            promptboxes[s],
            s == 1 and palbox or nil,
            layout = awful.widget.layout.horizontal.leftright
        },
        s == 1 and systray or nil,
        layoutboxes[s],
        s == screen.count() and clockbox    or nil,
        s == screen.count() and battbox     or nil,
        s == screen.count() and tempbox     or nil,
        s == screen.count() and volbox      or nil,
        s == 1 and todobox                  or nil,
        tasklists[s],
        layout = awful.widget.layout.horizontal.rightleft
    }
end

-- {{{1 Bindings
root.buttons(awful.util.table.join(
    awful.button({        }, 3  , function () menus.main:toggle()           end),
    awful.button({        }, 4  , awful.tag.viewprev                           ),
    awful.button({        }, 5  , awful.tag.viewnext                           )
))

clientbuttons = awful.util.table.join(
    awful.button({        }, 1  , function (c) client.focus = c; c:raise()  end),
    awful.button({ modkey }, 1  , awful.mouse.client.move                      ),
    awful.button({ modkey }, 3  , awful.mouse.client.resize                    )
)

globalkeys = awful.util.table.join(
    -- Standard programs
    awful.key({ modkey,           }, "Return", function () awful.util.spawn(settings.terminal)    end),
    awful.key({ modkey,           }, "Up"    , function () awful.util.spawn(settings.audio_up)    end),
    awful.key({ modkey,           }, "Down"  , function () awful.util.spawn(settings.audio_down)  end),
    awful.key({ modkey,           }, "End"   , function () awful.util.spawn(settings.audio_mute)  end),
    awful.key({ modkey,           }, "s"     , function () awful.util.spawn(settings.audio_stop)  end),
    awful.key({ modkey, "Shift"   }, "u"     , function () awful.util.spawn(settings.win_info)    end),
    awful.key({ "Control"         }, "6"     , function () awful.util.spawn(settings.screensaver) end),

    -- Awesome control
    awful.key({ modkey, "Control" }, "r"     , awesome.restart                                 ),
    awful.key({ modkey, "Shift"   }, "q"     , awesome.quit                                    ),
    awful.key({ modkey,           }, "w"     , function () menus.main:show(true)            end),

    -- Tag navigation
    awful.key({ modkey,           }, "Left"  , awful.tag.viewprev                              ),
    awful.key({ modkey,           }, "Right" , awful.tag.viewnext                              ),
    awful.key({ modkey,           }, "Escape", awful.tag.history.restore                       ),

    -- Client manipulation
    awful.key({ modkey, "Shift"   }, "h"     , function () awful.client.swap.byidx(  1)     end),
    awful.key({ modkey, "Shift"   }, "t"     , function () awful.client.swap.byidx( -1)     end),

    -- Client focus
    awful.key({ modkey,           }, "u"     , awful.client.urgent.jumpto                      ),
    awful.key({ modkey,           }, "h"     ,
        function ()
            awful.client.focus.byidx( 1)
            if client.focus then client.focus:raise() end
        end),
    awful.key({ modkey,           }, "t"     ,
        function ()
            awful.client.focus.byidx(-1)
            if client.focus then client.focus:raise() end
        end),
    awful.key({ modkey,           }, "Tab"   , function () awful.client.focus.history.previous() end),

    -- Screen focus
    awful.key({ modkey,           }, "d"     , function () focus_by_idx(2)                  end),
    awful.key({ modkey,           }, "n"     , function () focus_by_idx(1)                  end),
    awful.key({ modkey, "Control" }, "j"     , function () awful.screen.focus_relative( 1)  end),
    awful.key({ modkey, "Control" }, "k"     , function () awful.screen.focus_relative(-1)  end),

    -- Layout manipulation
    awful.key({ modkey,           }, "space" , function () awful.layout.inc(layouts,  1)    end),
    awful.key({ modkey, "Shift"   }, "space" , function () awful.layout.inc(layouts, -1)    end),

    awful.key({ modkey, "Control" }, "h"     , function () awful.tag.incmwfact( 0.05)       end),
    awful.key({ modkey, "Control" }, "t"     , function () awful.tag.incmwfact(-0.05)       end),
    awful.key({ modkey, "Shift"   }, "d"     , function () awful.tag.incnmaster( 1)         end),
    awful.key({ modkey, "Shift"   }, "n"     , function () awful.tag.incnmaster(-1)         end),
    awful.key({ modkey, "Control" }, "d"     , function () awful.tag.incncol( 1)            end),
    awful.key({ modkey, "Control" }, "n"     , function () awful.tag.incncol(-1)            end),

    -- Prompt
    awful.key({ modkey            }, "r"     , function () promptboxes[mouse.screen]:run()  end),

    awful.key({ modkey            }, "x"     ,
        function ()
            awful.prompt.run({ prompt = "Run Lua code: " },
            mypromptbox[mouse.screen].widget,
            awful.util.eval, nil,
            awful.util.getdir("cache") .. "/history_eval")
        end)
)

clientkeys = awful.util.table.join(
    awful.key({ modkey,           }, "f"     , function (c) c.fullscreen = not c.fullscreen  end),
    awful.key({ modkey, "Shift"   }, "c"     , function (c) c:kill()                         end),
    awful.key({ modkey, "Control" }, "space" , awful.client.floating.toggle                     ),
    awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end),
    awful.key({ modkey,           }, "o"     , awful.client.movetoscreen                        ),
    awful.key({ modkey, "Shift"   }, "r"     , function (c) c:redraw()                       end),
    awful.key({ modkey, "Shift"   }, "m"     , function (c) c.minimized = not c.minimized    end),
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

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it works on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, keynumber do
    globalkeys = awful.util.table.join(globalkeys,
        awful.key({ modkey            }, "#" .. i + 9,
            function ()
                local screen = mouse.screen
                if tags[screen][i] then
                    awful.tag.viewonly(tags[screen][i])
                end
            end),
        awful.key({ modkey, "Control" }, "#" .. i + 9,
            function ()
                local screen = mouse.screen
                if tags[screen][i] then
                    awful.tag.viewtoggle(tags[screen][i])
                end
            end),
        awful.key({ modkey, "Shift"   }, "#" .. i + 9,
            function ()
                if client.focus and tags[client.focus.screen][i] then
                    awful.client.movetotag(tags[client.focus.screen][i])
                end
            end),
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
            function ()
                if client.focus and tags[client.focus.screen][i] then
                    awful.client.toggletag(tags[client.focus.screen][i])
                end
            end))
end

-- Set keys
root.keys(globalkeys)

-- {{{1 Signals
-- Signal function to execute when a new client appears.
client.add_signal("manage", function (c, startup)
    -- Add a titlebar
    -- awful.titlebar.add(c, { modkey = modkey })

    -- Enable sloppy focus
    c:add_signal("mouse::enter", function(c)
        if awful.layout.get(c.screen) ~= awful.layout.suit.magnifier
            and awful.client.focus.filter(c) then
            client.focus = c
        end
    end)

    if not startup then
        -- Set the windows at the slave,
        -- i.e. put it at the end of others instead of setting it master.
        awful.client.setslave(c)

        -- Put windows in a smart way, only if they does not set an initial position.
        if not c.size_hints.user_position and not c.size_hints.program_position then
            awful.placement.no_overlap(c)
            awful.placement.no_offscreen(c)
        end
    end
end)

client.add_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.add_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)

-- vim: set ts=4 sw=4 sta et foldmethod=marker:
