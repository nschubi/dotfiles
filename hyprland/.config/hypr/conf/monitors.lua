------------------
---- MONITORS ----
------------------

-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
-- external Monitor
hl.monitor({
    output   = "DP-3",
    mode     = "3440x1440@85",
    position = "0x0",
    scale    = "1",
})

-- Framework Display
hl.monitor({
    output   = "eDP-1",
    mode     = "2256x1504@60",
    position = "3440x0",
    scale    = "1.57",
})

