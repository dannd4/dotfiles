local wezterm = require("wezterm")
local tabline = wezterm.plugin.require("https://github.com/michaelbrusegard/tabline.wez")

local M = {}

function M.options(config)
	tabline.setup({
		options = {
			theme = "Catppuccin Frappe",
		},
		sections = {
			tab_active = {
				"index",
				{ "tab", padding = { left = 0, right = 1 } },
				{ "zoomed", padding = 0 },
			},
			tab_inactive = {
				"index",
				{ "tab", padding = { left = 0, right = 0 } },
			},
			tabline_a = "",
			tabline_b = "",
			tabline_x = "",
			tabline_y = "",
			tabline_z = { "window" },
		},
	})

	tabline.apply_to_config(config)
end

return M
