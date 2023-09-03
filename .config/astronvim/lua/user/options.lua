vim.fn.setenv("FIG_TERM", nil)

return {
	opt = {
		list = true, -- show whitespace characters
		wrap = true,
		autoread = true,
		swapfile = false,
		conceallevel = 2, -- enable conceal
		splitkeep = "screen",
		showbreak = "↪ ",
		showtabline = (vim.t.bufs and #vim.t.bufs > 1) and 2 or 1,
		listchars = { tab = "│→", extends = "⟩", precedes = "⟨", trail = "·", nbsp = "␣" },
		fillchars = { eob = " ", diff = "╱" },
		spellfile = vim.fn.expand("~/.config/astronvim/lua/user/spell/en.utf-8.add"),
		thesaurus = vim.fn.expand("~/.config/astronvim/lua/user/spell/mthesaur.txt"),
	},
	g = {
		mapleader = " ", -- sets vim.g.mapleader
		resession_enabled = true,
	},
}
