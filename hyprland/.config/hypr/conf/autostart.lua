-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:
--
hl.on("hyprland.start", function ()
   hl.exec_cmd("protonmail-bridge")
   hl.exec_cmd("nextcloud")
   hl.exec_cmd("waybar")
   hl.exec_cmd("hyprpaper")
   hl.exec_cmd("hyprlock & hypridle")
end)

