return {
	{
		"zbirenbaum/copilot.lua",
		event = "User AstroFile",
		opts = {
			panel = {
				auto_refresh = true,
			},
			suggestion = {
				auto_trigger = true, -- Suggest as we start typing
				debounce = 150,
			},
			copilot_node_command = "/Users/dan/.volta/tools/image/node/18.15.0/bin/node",
		},
	},
}
