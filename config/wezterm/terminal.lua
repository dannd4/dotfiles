local wezterm = require("wezterm")

local M = {}

function M.options(config)
	config.color_scheme = "Catppuccin Frappe"

	config.font = wezterm.font_with_fallback({
		{
			family = "Comic Code",
			weight = "Bold",
		},
		{
			family = "Comic Code Ligatures",
			weight = "Bold",
		},
		{
			family = "Hack Nerd Font",
			weight = "Bold",
		},
	})
	config.font_size = 11
	config.line_height = 1.25

	config.enable_tab_bar = true
	config.use_fancy_tab_bar = false
	config.tab_bar_at_bottom = false
	config.hide_tab_bar_if_only_one_tab = true
	config.show_new_tab_button_in_tab_bar = false

	config.window_decorations = "RESIZE"
	config.window_padding = { left = 0, right = 0, top = 0, bottom = 0 }

	config.front_end = "WebGpu"
	config.audible_bell = "Disabled"
	config.default_cursor_style = "SteadyBar"
	config.cursor_blink_rate = 0
	config.native_macos_fullscreen_mode = true
end

return M
