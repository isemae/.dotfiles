local wezterm = require("wezterm")

local config = wezterm.config_builder()

-- config.color_scheme = "terafox"
-- config.color_scheme = "Maia (Gogh)"
config.color_scheme = "Adventure"
config.colors = {
	cursor_bg = "#f0d29d",
	cursor_fg = "black",
	cursor_border = "#e0e0c9",
	tab_bar = {
		active_tab = {
			bg_color = "#242430",
			fg_color = "#f0d29d",
		},
		inactive_tab = {
			bg_color = "#1c1c27",
			fg_color = "#aaa",
		},
		new_tab = {
			bg_color = "#101112",
			fg_color = "#aaa",
		},
		inactive_tab_edge = "#1e1e20",
	},
}
config.window_frame = {
	font_size = 15.0,
	active_titlebar_bg = "#0f1118",
	inactive_titlebar_bg = "#0f1118",
}
config.window_padding = {
	left = 0,
	right = 0,
	top = 2,
	bottom = 0,
}
config.exit_behavior = "CloseOnCleanExit"
wezterm.action({ CloseCurrentTab = { confirm = false } })

config.window_background_gradient = {
	orientation = { Linear = { angle = -90.0 } },
	colors = { "#242430" },
}

config.font_size = 18
config.line_height = 1
config.font = wezterm.font("D2Coding Nerd", { italic = false, weight = "Regular" })

config.keys = {
	{
		key = "w",
		mods = "CMD",
		action = wezterm.action.CloseCurrentTab({ confirm = false }),
	},
}

return config
