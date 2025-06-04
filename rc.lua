-- Minimal AwesomeWM configuration for my Arch Linux laptop
-- Place this file at ~/.config/awesome/rc.lua

local gears = require("gears")
local awful = require("awful")
local beautiful = require("beautiful")

local terminal = "alacritty"
local modkey = "Mod4"

beautiful.init(gears.filesystem.get_themes_dir() .. "default/theme.lua")
awful.layout.layouts = { awful.layout.suit.tile, awful.layout.suit.floating }

awful.keyboard.append_global_keybindings({
    awful.key({ modkey }, "Return", function () awful.spawn(terminal) end,
              {description = "open terminal", group = "launcher"}),
    awful.key({ modkey, "Shift" }, "r", awesome.restart,
              {description = "reload awesome", group = "awesome"}),
    awful.key({ modkey, "Shift" }, "q", awesome.quit,
              {description = "quit awesome", group = "awesome"})
})

awful.screen.connect_for_each_screen(function(s)
    awful.tag({ "1", "2", "3", "4", "5" }, s, awful.layout.layouts[1])
end)
