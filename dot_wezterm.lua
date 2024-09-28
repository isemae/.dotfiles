local wezterm = require("wezterm")
local config = wezterm.config_builder()
local act = wezterm.action

if wezterm.target_triple == "aarch64-apple-darwin" then
	-- font_dirs    = { '$HOME/.dotfiles/.fonts' }
	config.font = wezterm.font_with_fallback({

		-- for monospaced characters
		{
			family = "Iosevka Custom",
			-- 	family = "JetBrainsMonoNL Nerd Font Mono",
			weight = "Regular",
			harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
		},

		-- for symbols and monospaced korean characters
		{
			family = "Sarasa Mono K Nerd Font",
			-- 	family = "D2CodingLigature Nerd Font Mono",
			weight = "Regular",
			harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
		},
	})

	config.font_size = 16
	-- config.line_height = 1.03

	config.front_end = "WebGpu"

	-- config.color_scheme = "Black Metal (base16)"
	-- config.color_scheme = "terafox"
	-- config.color_scheme = "Maia (Gogh)"
	-- config.color_scheme = "Rosé Pine Moon (Gogh)"

	config.colors = {
		ansi = { "#393552", "#eb6f92", "#3e8fb0", "#f6c177", "#9ccfd8", "#c4a7e7", "#ea9a97", "#e0def4" },
		brights = { "#6e6a86", "#eb6f92", "#3e8fb0", "#f6c177", "#9ccfd8", "#c4a7e7", "#ea9a97", "#e0def4" },

		foreground = "#e0def4",
		background = "#232136",
		-- background = "#1f1f28",

		selection_fg = "#e0def4",
		selection_bg = "#44415a",

		cursor_bg = "#f0d2bd",
		cursor_fg = "black",
		cursor_border = "#f0d2bd",

		-- tab styles
		tab_bar = {
			active_tab = {
				bg_color = "none",
				fg_color = "#f0d29d",
			},
			inactive_tab = {
				bg_color = "none",
				fg_color = "#aaa",
			},
			new_tab = {
				bg_color = "none",
				fg_color = "#aaa",
			},
			inactive_tab_edge = "none",
			inactive_tab_hover = {
				bg_color = "none",
				fg_color = "#d5c7ac",
			},
		},
	}

	config.window_frame = {
		font = wezterm.font({ family = "Pretendard jp variable", italic = false, weight = "DemiBold" }),
		font_size = 14.0,
		active_titlebar_bg = "none",
		inactive_titlebar_bg = "none",
	}
	config.window_padding = {
		left = 10,
		right = 10,
		top = 60,
		bottom = 2,
	}
	config.exit_behavior = "Close"
	wezterm.action({ CloseCurrentTab = { confirm = false } })

	-- config.window_background_gradient = {
	-- 	orientation = { Linear = { angle = -90.0 } },
	-- 	colors = { "#242430" },
	-- }
	config.window_decorations = "INTEGRATED_BUTTONS | RESIZE"
	config.enable_tab_bar = true
	config.tab_bar_at_bottom = true
	config.show_new_tab_button_in_tab_bar = true
	config.show_tab_index_in_tab_bar = false
	config.hide_tab_bar_if_only_one_tab = true
	-- config.show_close_tab_button_in_tabs = false -- nightly only for now

	config.window_close_confirmation = "NeverPrompt"
	config.window_background_opacity = 0.97
	config.macos_window_background_blur = 60

	config.cursor_blink_rate = 0
	config.default_cursor_style = "BlinkingBlock"
	config.animation_fps = 1

	config.keys = {
		{
			key = "w",
			mods = "CMD",
			action = wezterm.action.CloseCurrentTab({ confirm = false }),
		},
		{
			key = "n",
			mods = "CMD",
			action = act({ SpawnCommandInNewWindow = { cwd = wezterm.home_dir } }),
		},
		{
			mods = "CMD",
			key = "Backspace",
			action = wezterm.action.Multiple({
				wezterm.action.SendKey({ mods = "CTRL", key = "u" }),
				wezterm.action.SendKey({ mods = "CTRL", key = "k" }),
			}),
		},
		{
			key = ",",
			mods = "CMD",
			action = act.SpawnCommandInNewTab({
				cwd = os.getenv("Users/ji/.wezterm.lua"),
				set_environment_variables = {
					TERM = "screen-256color",
				},
				args = {
					os.getenv("SHELL"),
					"-c",
					"nvim " .. wezterm.shell_quote_arg(wezterm.config_file),
				},
			}),
			-- other keys
		},
	}

	return config
end

if wezterm.target_triple == "x86_64-pc-windows-msvc" then
	-- Configs for Windows only
	-- font_dirs = {
	--     'C:\\Users\\whoami\\.dotfiles\\.fonts'
	-- }
	-- default_prog = { "wsl.exe", "~", "-d", "Ubuntu-20.04" }
end

if wezterm.target_triple == "x86_64-unknown-linux-gnu" then
	-- Configs for Linux only
	-- font_dirs    = { '$HOME/.dotfiles/.fonts' }
end
