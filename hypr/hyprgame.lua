hl.monitor({
	output = "DP-3",
	mode = "3440x1440@180",
	position = "0x0",
	scale = 1,
})

hl.on("hyprland.start", function()
	hl.exec_cmd("cartridges")
end)

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("LANG", "pt_PT.UTF-8")

hl.config({
	general = {

		gaps_in = 0,
		gaps_out = 0,

		border_size = 0,

		col = {
			active_border = "rgb(548A63)",
			inactive_border = "rgb(000000)",
		},

		resize_on_border = false,

		allow_tearing = false,

		layout = "monocle",
	},

	decoration = {

		rounding = 0,

		active_opacity = 1.0,
		inactive_opacity = 1.0,

		shadow = {
			enabled = false,
			range = 16,
			render_power = 5,
			color = "rgba(00000000)",
		},

		blur = {
			enabled = false,
			new_optimizations = true,
			size = 2,
			passes = 3,
			vibrancy = 0.1696,
		},
	},

	animations = {
		enabled = false,
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

		kb_options = "grp:alt_shift_toggle,",

		follow_mouse = 1,

		sensitivity = 0,

		touchpad = {
			natural_scroll = false,
		},
	},
})

hl.bind("SUPER + left", hl.dsp.layout("cycleprev"))
hl.bind("SUPER + right", hl.dsp.layout("cyclenext"))
hl.bind(
	"SUPER + P",
	hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'")
)
hl.bind("SUPER + D", hl.dsp.exec_cmd("fuzzel"))
hl.bind("SUPER + Q", hl.dsp.window.close())
