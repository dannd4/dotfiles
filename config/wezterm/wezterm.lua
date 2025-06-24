local wezterm = require("wezterm")
local keymaps = require("keymaps")
local terminal = require("terminal")
local tabline = require("tabline")

wezterm.on("gui-startup", function(cmd)
	local mux = wezterm.mux
	local tab, pane, window = mux.spawn_window(cmd or {})
	local gui_window = window:gui_window()
	gui_window:maximize()
end)

local config = {}

-- In newer versions of wezterm, use the config_builder which will help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

terminal.options(config)
keymaps.options(config)
tabline.options(config)

return config
