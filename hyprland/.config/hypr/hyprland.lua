-- This is an example Hyprland Lua config file.
-- Refer to the wiki for more information.
-- https://wiki.hypr.land/Configuring/Start/

require("conf/monitors")
require("conf/autostart")
require("conf/permissions")
require("conf/looknfeel")
require("conf/misc")
require("conf/input")
require("conf/keybinds")
require("conf/windows")

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

