---------------------
---- XWAYLAND -------
---------------------
--- More details: https://wiki.hypr.land/Configuring/Advanced-and-Cool/XWayland/
hl.monitor({ output = "eDP-1", mode = "1920x1080@60", position = "0x0", scale = "1.33" })

-- unscale XWayland
hl.config({
	xwayland = {
		force_zero_scaling = true,
	},
})
