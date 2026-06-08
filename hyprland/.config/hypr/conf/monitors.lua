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
local laptopMonitor = {
    output   = "eDP-1",
    mode     = "2256x1504@60",
    position = "3440x0",
    scale    = "1.177",
    disabled = false,
}

-- register monitor settings on startup
hl.monitor(laptopMonitor)

function disableLaptopMonitor()
    hl.monitor({
        output = laptopMonitor.output,
        disabled = true,
    })
end

function enableLaptopMonitor()
    hl.monitor(laptopMonitor)
    os.execute("hyprctl reload")
end

-- close lid
hl.bind("switch:on:Lid Switch", disableLaptopMonitor, { locked = true })
-- open lid
hl.bind("switch:off:Lid Switch", enableLaptopMonitor, { locked = true })
