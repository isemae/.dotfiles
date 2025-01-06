local wezterm = require("wezterm")
local config = wezterm.config_builder()
local act = wezterm.action

if wezterm.target_triple == "aarch64-apple-darwin" then
	-- font_dirs    = { '$HOME/.dotfiles/.fonts' }
	config.font = wezterm.font_with_fallback({

		-- for monospaced characters
		{
			-- 	family = "JetBrainsMonoNL Nerd Font Mono",
			family = "Iosevka Custom",
			weight = "Regular",
			harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
		},
		{
			family = "Sarasa Mono K nerd font",
			weight = "Regular",
			harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
		},

		{
			family = "Sarasa Mono J",
			weight = "Regular",
			harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
		},
		{
			family = "Sarasa Mono SC",
			weight = "Regular",
			harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
		},
	})

	config.font_size = 15
	-- config.line_height = 1.03

	config.front_end = "WebGpu"
	-- config.color_scheme = "terafox"
	-- config.color_scheme = "Maia (Gogh)"
	config.color_scheme = "Rosé Pine Moon (Gogh)"

	config.colors = {
		-- ansi = {
		-- 	"#393552",
		-- 	"#fd6592",
		-- 	"#3e8fb0",
		-- 	"#f6c177",
		-- 	"#8dd1da",
		-- 	"#c4a7e7",
		-- 	"#ffb1ae",
		-- 	"#e0def4",
		-- },
		-- brights = { "#6e6a86", "#fd6592", "#3e8fb0", "#f6c177", "#8dd1da", "#c4a7e7", "#ffb1ae", "#e0def4" },
		--
		-- foreground = "#e0def4",
		-- background = "#232131",
		-- -- background = "#242430",
		--
		-- selection_fg = "#e0def4",
		-- selection_bg = "#44415a",
		--
		-- cursor_bg = "#f0d2bd",
		-- cursor_fg = "black",
		-- cursor_border = "#f0d2bd",

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

	config.initial_rows = 48
	config.initial_cols = 120

	config.window_frame = {
		font = wezterm.font({ family = "Pretendard jp variable", italic = false, weight = "Regular" }),
		font_size = 14.0,
		active_titlebar_bg = "none",
		inactive_titlebar_bg = "none",
	}
	config.window_padding = {
		left = 10,
		right = 2,
		top = 60,
		bottom = 2,
	}
	config.exit_behavior = "Close"
	wezterm.action({ CloseCurrentTab = { confirm = false } })

	-- config.window_background_gradient = {
	-- 	orientation = { Linear = { angle = -90.0 } },
	-- 	colors = { "#242430" },
	-- }
	config.window_decorations = "INTEGRATED_BUTTONS | RESIZE | MACOS_FORCE_ENABLE_SHADOW"
	config.enable_tab_bar = true
	config.tab_bar_at_bottom = true
	config.show_new_tab_button_in_tab_bar = true
	config.show_tab_index_in_tab_bar = false
	config.hide_tab_bar_if_only_one_tab = true
	-- config.show_close_tab_button_in_tabs = false -- nightly only for now

	config.window_close_confirmation = "NeverPrompt"

	config.window_background_opacity = 0.80
	config.macos_window_background_blur = 60
	config.cursor_blink_rate = 0
	config.default_cursor_style = "BlinkingBlock"
	config.animation_fps = 120
	config.max_fps = 120

	-- config.enable_kitty_keyboard = true
	-- config.enable_csi_u_key_encoding = false
	config.keys = {
		{
			mods = "CMD",
			key = "n",
			action = act({ SpawnCommandInNewWindow = { cwd = wezterm.home_dir } }),
		},
		{
			mods = "CMD",
			key = "ㅜ",
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
			mods = "CMD",
			key = ",",
			action = act.SpawnCommandInNewTab({
				args = { "/opt/homebrew/bin/nvim", wezterm.config_file },
			}),
		},
		{
			key = ";",
			mods = "CMD",
			action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
		},
		{
			key = "'",
			mods = "CMD",
			action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
		},
		-- Cycle panes
		{ key = "l", mods = "CMD", action = wezterm.action({ ActivatePaneDirection = "Right" }) },
		{ key = "h", mods = "CMD", action = wezterm.action({ ActivatePaneDirection = "Left" }) },
		{ key = "k", mods = "CMD", action = wezterm.action({ ActivatePaneDirection = "Up" }) },
		{ key = "j", mods = "CMD", action = wezterm.action({ ActivatePaneDirection = "Down" }) },
		{
			key = "w",
			mods = "CMD",
			action = wezterm.action.CloseCurrentPane({ confirm = true }),
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
