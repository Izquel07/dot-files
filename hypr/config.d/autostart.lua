-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:
--
hl.on("hyprland.start", function()
	-- Authentication agent
	hl.exec_cmd("systemctl --user start hyprpolkitagent")

	-- Wallpaper
	hl.exec_cmd("awww-daemon")
	hl.exec_cmd('awww img -o eDP-1 "/ruta/a/tu/fondo.jpg"')

	-- System tray
	hl.exec_cmd("nm-applet")

	-- Shell
	hl.exec_cmd("ashell")

	-- Idle management
	hl.exec_cmd("hypridle")

    -- Dark theme
    hl.exec_cmd('gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"')
    hl.exec_cmd('gsettings set org.gnome.desktop.interface gtk-theme "Adwaita-dark"')
end)
