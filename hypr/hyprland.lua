-- ~/.config/hypr/hyprland.lua

------------------
---- MONITORS ----
------------------

hl.monitor({
	output = "DP-3",
	mode = "3440x1440@180",
	position = "0x0",
	scale = 1,
})

---------------------
---- MY PROGRAMS ----
---------------------

local terminal = "GTK_IM_MODULE=simple ghostty"
local fileManager = "nemo"
local menu = "fuzzel"
local mainMod = "SUPER"
local hy3 = hl.plugin.hy3

-------------------
---- AUTOSTART ----
-------------------

hl.on("hyprland.start", function()
	hl.exec_cmd("nm-applet")
	hl.exec_cmd("nicotine -s")
	hl.exec_cmd("/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1")

	hl.exec_cmd("hyprctl setcursor Hackneyed-24px 24")

	hl.exec_cmd("wl-paste --watch cliphist store")

	hl.exec_cmd("qs -c overview")
	hl.exec_cmd("QT_QPA_PLATFORMTHEME=gtk3 qs -c noctalia-shell")

	hl.exec_cmd("hyprpaper")

	hl.exec_cmd("$HOME/.config/eww/scripts/start.sh")

	hl.exec_cmd("hyprpm reload -n")
end)

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("LANG", "pt_PT.UTF-8")

-----------------------
---- LOOK AND FEEL ----
-----------------------

hl.config({

	--plugin = {

	--	hy3 = {
	--		no_gaps_when_only = false,
	--		node_collapse_policy = 2,
	--		group_inset = 10,
	--		tab_first_window = true,
	--		tabs = {
	--			height = 15,
	--			padding = 5,
	--		},
	--	},
	--},
	general = {

		gaps_in = 5,
		gaps_out = 10,

		border_size = 0,

		col = {
			active_border = "rgb(ffffff)",
			inactive_border = "rgb(ffffff)",
		},

		resize_on_border = true,

		allow_tearing = false,

		layout = "hy3",
	},

	decoration = {

		rounding = 0,

		active_opacity = 1.0,
		inactive_opacity = 0.8,

		shadow = {
			enabled = true,
			range = 16,
			render_power = 5,
			color = "rgba(00000000)",
		},

		blur = {
			enabled = true,
			new_optimizations = true,
			size = 2,
			passes = 3,
			vibrancy = 0.1696,
		},
	},

	animations = {
		enabled = false,
	},

	dwindle = {
		preserve_split = true,
	},

	master = {
		new_status = "master",
	},

	misc = {
		force_default_wallpaper = 0,
		disable_hyprland_logo = true,
	},

	cursor = {
		no_hardware_cursors = true,
	},

	input = {

		kb_layout = "us",
		kb_variant = "intl",

		kb_options = "grp:alt_shift_toggle,caps:escape_shifted_capslock",

		follow_mouse = 1,

		sensitivity = 0,

		touchpad = {
			natural_scroll = false,
		},
	},
})

----------------
---- CURVES ----
----------------

hl.curve("myBezier", {
	type = "bezier",
	points = {
		{ 0, 1 },
		{ 0.18, 1.0 },
	},
})

--------------------
---- ANIMATIONS ----
--------------------

hl.animation({
	leaf = "windows",
	enabled = true,
	speed = 1.5,
	bezier = "myBezier",
})

hl.animation({
	leaf = "windowsOut",
	enabled = true,
	speed = 2,
	bezier = "myBezier",
	style = "popin 95%",
})

hl.animation({
	leaf = "border",
	enabled = true,
	speed = 12,
	bezier = "myBezier",
})

hl.animation({
	leaf = "fade",
	enabled = true,
	speed = 6,
	bezier = "default",
})

hl.animation({
	leaf = "workspaces",
	enabled = true,
	speed = 6,
	bezier = "default",
})

---------------------
---- KEYBINDINGS ----
---------------------

hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(terminal))

hl.bind(mainMod .. " + Q", hy3.kill_active())

hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd("hyprshot --mode region --output-folder /tmp"))

hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))

hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))

hl.bind(
	mainMod .. " + C",
	hl.dsp.exec_cmd("pkill fuzzel || cliphist list | fuzzel --dmenu | cliphist decode | wl-copy")
)

--hl.bind(mainMod .. " + F", hl.dsp.fullscreen({ mode = 0 }))

hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd(menu .. " || pkill " .. menu))

hl.bind(mainMod .. " + TAB", hl.dsp.exec_cmd("qs ipc -c overview call overview toggle"))

hl.bind(mainMod .. " + ALT + SPACE", hl.dsp.exec_cmd("vieb"))

hl.bind(mainMod .. " + MINUS", hy3.change_group("opposite"))

hl.bind(mainMod .. " + S", hy3.make_group("v"))
hl.bind(mainMod .. " + A", hy3.make_group("h"))

hl.bind(mainMod .. " + Z", hy3.change_group("toggletab"))

hl.bind(mainMod .. " + left", hy3.move_focus("l"))
hl.bind(mainMod .. " + down", hy3.move_focus("d"))
hl.bind(mainMod .. " + up", hy3.move_focus("u"))
hl.bind(mainMod .. " + right", hy3.move_focus("r"))

hl.bind(mainMod .. " + SHIFT + left", hy3.move_window("l"))
hl.bind(mainMod .. " + SHIFT + down", hy3.move_window("d"))
hl.bind(mainMod .. " + SHIFT + up", hy3.move_window("u"))
hl.bind(mainMod .. " + SHIFT + right", hy3.move_window("r"))

hl.bind(mainMod .. " + CTRL + up", hy3.change_focus("raise"))
hl.bind(mainMod .. " + CTRL + down", hy3.change_focus("lower"))

hl.bind(mainMod .. " + CTRL + right", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + CTRL + SHIFT + right", hl.dsp.window.move({ workspace = "e+1" }))
hl.bind(mainMod .. " + CTRL + left", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mainMod .. " + CTRL + SHIFT + left", hl.dsp.window.move({ workspace = "e-1" }))

hl.bind(mainMod .. " + H", hy3.move_focus("l"))
hl.bind(mainMod .. " + J", hy3.move_focus("d"))
hl.bind(mainMod .. " + K", hy3.move_focus("u"))
hl.bind(mainMod .. " + L", hy3.move_focus("r"))

hl.bind(mainMod .. " + SHIFT + H", hy3.move_window("l"))
hl.bind(mainMod .. " + SHIFT + J", hy3.move_window("d"))
hl.bind(mainMod .. " + SHIFT + K", hy3.move_window("u"))
hl.bind(mainMod .. " + SHIFT + L", hy3.move_window("r"))

hl.bind(mainMod .. " + CTRL + K", hy3.change_focus("raise"))
hl.bind(mainMod .. " + CTRL + J", hy3.change_focus("lower"))

hl.bind(mainMod .. " + CTRL + L", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + CTRL + SHIFT + L", hl.dsp.window.move({ workspace = "e+1" }))
hl.bind(mainMod .. " + CTRL + H", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mainMod .. " + CTRL + SHIFT + H", hl.dsp.window.move({ workspace = "e-1" }))

--------------------------
---- WORKSPACE BINDS ----
--------------------------

for i = 1, 10 do
	local key = i % 10

	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))

	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

------------------------
---- SPECIAL WS ----
------------------------

hl.bind(mainMod .. " + W", hl.dsp.workspace.toggle_special("magic"))

hl.bind(
	mainMod .. " + SHIFT + W",
	hl.dsp.window.move({
		workspace = "special:magic",
	})
)

-------------------------
---- MOUSE BINDS ----
-------------------------

hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })

hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

--------------------------
---- MEDIA KEYS ----
--------------------------

hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"),
	{ locked = true, repeating = true }
)

hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
	{ locked = true, repeating = true }
)

hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true })

---------------------------
---- LAYER RULES ----
---------------------------

hl.layer_rule({

	match = {
		namespace = "fuzzel",
	},

	blur = true,
	ignore_alpha = 0.5,
})

hl.layer_rule({

	match = {
		namespace = "waybar",
	},

	blur = true,
	ignore_alpha = 0.5,
})

----------------------------
---- WINDOW RULES ----
----------------------------

hl.window_rule({

	match = {
		class = "com.mitchellh.ghostty",
	},

	opacity = 0.8,
})
