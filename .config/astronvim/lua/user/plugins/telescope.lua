return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"kkharji/sqlite.lua",
		{ "nvim-telescope/telescope-fzf-native.nvim", enabled = false },
		"nvim-telescope/telescope-fzy-native.nvim",
		"nvim-telescope/telescope-frecency.nvim",
		"nvim-telescope/telescope-smart-history.nvim",
		"nvim-telescope/telescope-live-grep-args.nvim",
		"nvim-telescope/telescope-media-files.nvim",
	},
	opts = function(_, opts)
		-- local telescope = require "telescope"
		-- local actions = require "telescope.actions"
		local lga_actions = require("telescope-live-grep-args.actions")

		return require("astronvim.utils").extend_tbl(opts, {
			defaults = {
				preview = false,
				selection_caret = "  ",
				path_display = { "absolute" },
				color_devicons = true,
				set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
				vimgrep_arguments = {
					"rg",
					"--color=never",
					"--no-heading",
					"--with-filename",
					"--line-number",
					"--column",
					"--smart-case",
					"--hidden",
					"--glob=!.git/",
				},
				history = {
					path = "~/.local/share/nvim/databases/telescope_history.sqlite3",
					limit = 100,
				},
				file_sorter = require("telescope.sorters").get_fuzzy_file,
			},
			extensions = {
				frecency = {
					default_workspace = "CWD",
					show_scores = false,
					show_filter_column = false,
					show_unindexed = false,
					ignore_patterns = {
						"*.git/*",
						"*/tmp/*",
						"*/node_modules/*",
						"*/vendor/*",
					},
				},
				live_grep_args = {
					auto_quoting = true, -- enable/disable auto-quoting
					mappings = {
						i = {
							["<C-i>"] = lga_actions.quote_prompt(),
						},
					},
					preview = true,
					path_display = { "truncate" },
				},
				media_files = {
					filetypes = { "png", "webp", "jpg", "jpeg", "svg" },
					find_cmd = "rg", -- find command (defaults to `fd`)
				},
			},
		})
	end,
	config = function(...)
		require("plugins.configs.telescope")(...)
		local telescope = require("telescope")
		telescope.load_extension("fzy_native")
		telescope.load_extension("frecency")
		telescope.load_extension("smart_history")
		telescope.load_extension("live_grep_args")
		telescope.load_extension("media_files")
	end,
}
