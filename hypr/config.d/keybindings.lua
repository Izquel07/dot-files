---------------------
---- KEYBINDINGS ----
---------------------

local programs = require("./config.d/programs")
local mainMod = "SUPER"

---------------------
---- APPLICATIONS ---
---------------------

-- Abrir terminal
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd(programs.terminal))

-- Cerrar ventana activa
local closeWindowBind = hl.bind(mainMod .. " + Q", hl.dsp.window.close())

-- Descomenta para desactivar el atajo de cerrar ventana
-- closeWindowBind:set_enabled(false)

-- Salir de Hyprland o abrir hyprshutdown si está instalado
hl.bind(
	mainMod .. " + M",
	hl.dsp.exec_cmd("if command -v hyprshutdown >/dev/null 2>&1; then hyprshutdown; else hyprctl dispatch exit; fi")
)

-- Administrador de archivos
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(programs.fileManager))

-- Alternar ventana flotante
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))

-- Abrir lanzador de aplicaciones
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(programs.menu))
hl.bind(mainMod .. " + N", hl.dsp.exec_cmd(programs.textEditor))

-- Funciones del layout dwindle
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))

---------------------
---- SCREENSHOTS ----
---------------------

-- Print: seleccionar zona y copiar al portapapeles
hl.bind("Print", hl.dsp.exec_cmd('grim -g "$(slurp)" - | wl-copy'))

-- Shift + Print: pantalla completa y copiar al portapapeles
hl.bind("SHIFT + Print", hl.dsp.exec_cmd("grim - | wl-copy"))

---------------------
---- WINDOW RULES ----
---------------------

-- Super + F: maximizar/restaurar conservando bordes y Waybar
hl.bind(
	mainMod .. " + F",
	hl.dsp.window.fullscreen({
		mode = "maximized",
		action = "toggle",
	})
)

---------------
--- SCRIPTS ---
---------------
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd("bash ~/.config/hypr/scripts/wallpaper.sh"))

---------------------
---- FOCUS ----------
---------------------

hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))

---------------------
---- WORKSPACES -----
---------------------

-- SUPER + 1-9 y SUPER + 0 para el escritorio 10
-- SUPER + SHIFT + número para mover la ventana

for i = 1, 10 do
	local key = i % 10

	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))

	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

---------------------
---- SCRATCHPAD -----
---------------------

hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))

hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

---------------------
---- SCROLL ----------
---------------------

hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))

hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

---------------------
---- MOVE / RESIZE --
---------------------

hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })

hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

---------------------
---- AUDIO ----------
---------------------

hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
	{ locked = true, repeating = true }
)

hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
	{ locked = true, repeating = true }
)

hl.bind(
	"XF86AudioMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
	{ locked = true, repeating = true }
)

hl.bind(
	"XF86AudioMicMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
	{ locked = true, repeating = true }
)

---------------------
---- BRIGHTNESS -----
---------------------

hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })

hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

---------------------
---- MEDIA ----------
---------------------

-- Requiere playerctl

hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })

hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })

hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })

hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
