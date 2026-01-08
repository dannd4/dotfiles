local wezterm = require("wezterm")

local act = wezterm.action
local gui = wezterm.gui

local M = {}

function M.options(config)
	config.keys = {
		{ key = "F12", mods = "LEADER", action = wezterm.action.ShowLauncher },
	}

	-- copy_mode
	local copy_mode = gui.default_key_tables().copy_mode
	table.insert(copy_mode, { key = "B", mods = "NONE", action = act.CopyMode("MoveToStartOfLineContent") })
	table.insert(copy_mode, { key = "E", mods = "NONE", action = act.CopyMode("MoveToEndOfLineContent") })

	-- search_mode
	local search_mode = gui.default_key_tables().search_mode
	table.insert(search_mode, { key = "c", mods = "CTRL", action = act.CopyMode("Close") })

	-- copy_mode <=> search_mode
	table.insert(copy_mode, { key = "/", mods = "NONE", action = act.Search({ CaseInSensitiveString = "" }) })
	table.insert(search_mode, { key = "Enter", mods = "SHIFT", action = act.ActivateCopyMode })

	config.key_tables = {
		copy_mode = copy_mode,
		search_mode = search_mode,
	}

	config.mouse_bindings = {
		-- Open a link
		{
			event = { Up = { streak = 1, button = "Left" } },
			mods = "CTRL",
			action = wezterm.action.OpenLinkAtMouseCursor,
		},

		{
			event = { Down = { streak = 1, button = "Right" } },
			mods = "NONE",
			action = wezterm.action_callback(function(window, pane)
				local has_selection = window:get_selection_text_for_pane(pane) ~= ""
				if has_selection then
					window:perform_action(act.CopyTo("ClipboardAndPrimarySelection"), pane)
					window:perform_action(act.ClearSelection, pane)
				else
					window:perform_action(act({ PasteFrom = "Clipboard" }), pane)
				end
			end),
		},
	}
end

return M
