vim.fn.setenv("FIG_TERM", nil)

return {
  opt = {
    conceallevel = 2, -- enable conceal
    list = true, -- show whitespace characters
    listchars = { tab = "│→", extends = "⟩", precedes = "⟨", trail = "·", nbsp = "␣" },
    showbreak = "↪ ",
    showtabline = 1,
    swapfile = false,
    spellfile = vim.fn.expand "~/.config/nvim/lua/user/spell/en.utf-8.add",
    thesaurus = vim.fn.expand "~/.config/nvim/lua/user/spell/mthesaur.txt",
    wrap = true, -- soft wrap lines
    fillchars = { eob = " ", diff = "╱" },
    autoread = true,
  },
  g = {
    mapleader = " ", -- sets vim.g.mapleader
    resession_enabled = true,
  },
}
