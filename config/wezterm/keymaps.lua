local wezterm = require("wezterm")

local act = wezterm.action
local gui = wezterm.gui

local function is_vim(pane)
	return pane:get_user_vars().IS_NVIM == "true"
end

local function is_tmux(pane)
	return pane:get_user_vars().WEZTERM_IN_TMUX == "1"
end

wezterm.on("user-var-changed", function(window, pane)
	local overrides = window:get_config_overrides() or {}

	if is_tmux(pane) then
		if not overrides.leader then
			overrides.leader = { key = "_", mods = "CTRL|SHIFT|ALT", timeout_milliseconds = 1000 }
		end
	elseif overrides.leader then
		overrides.leader = nil
	end

	window:set_config_overrides(overrides)
end)

local function split_nav(resize_or_move, key, direction)
	return {
		key = key,
		mods = resize_or_move == "resize" and "META" or "CTRL",
		action = wezterm.action_callback(function(win, pane)
			if is_vim(pane) or is_tmux(pane) then
				-- pass the keys through to nvim/tmux
				win:perform_action(
					{ SendKey = { key = key, mods = resize_or_move == "resize" and "META" or "CTRL" } },
					pane
				)
			else
				if resize_or_move == "resize" then
					win:perform_action({ AdjustPaneSize = { direction, 5 } }, pane)
				else
					win:perform_action({ ActivatePaneDirection = direction }, pane)
				end
			end
		end),
	}
end

local M = {}

function M.options(config)
	config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }

	config.keys = {
		{ key = ".", mods = "LEADER", action = wezterm.action.ShowLauncher },
		{
			key = "a",
			mods = "LEADER|CTRL",
			action = wezterm.action.SendKey({ key = "a", mods = "CTRL" }),
		},

		-- ==================== TABS ====================
		{
			key = ",",
			mods = "LEADER",
			action = act.PromptInputLine({
				description = "Enter new name for tab",
				action = wezterm.action_callback(function(window, pane, line)
					if line then
						window:active_tab():set_title(line)
					end
				end),
			}),
		},
		{
			key = "w",
			mods = "LEADER",
			action = act.ShowTabNavigator,
		},
		{
			key = "c",
			mods = "LEADER",
			action = act.SpawnTab("CurrentPaneDomain"),
		},
		{
			key = "X",
			mods = "LEADER",
			action = act.CloseCurrentTab({ confirm = true }),
		},

		-- ==================== PANES ====================
		split_nav("move", "h", "Left"),
		split_nav("move", "j", "Down"),
		split_nav("move", "k", "Up"),
		split_nav("move", "l", "Right"),
		split_nav("resize", "LeftArrow", "Left"),
		split_nav("resize", "DownArrow", "Down"),
		split_nav("resize", "UpArrow", "Up"),
		split_nav("resize", "RightArrow", "Right"),
		{
			key = "\\",
			mods = "LEADER",
			action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
		},
		{
			key = "-",
			mods = "LEADER",
			action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
		},
		{
			key = "x",
			mods = "LEADER",
			action = wezterm.action.CloseCurrentPane({ confirm = false }),
		},
		{
			key = "z",
			mods = "LEADER",
			action = wezterm.action.TogglePaneZoomState,
		},
		{
			key = "Enter",
			mods = "CMD",
			action = wezterm.action.TogglePaneZoomState,
		},
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
