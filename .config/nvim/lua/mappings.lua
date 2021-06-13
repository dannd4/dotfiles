local function map(mode, lhs, rhs, opts)
    local options = {noremap = true}
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local opt = {}

-- dont copy any deleted text , this is disabled by default so uncomment the below mappings if you want them!
--[[ remove this line

map("n", "dd", [=[ "_dd ]=], opt)
map("v", "dd", [=[ "_dd ]=], opt)
map("v", "x", [=[ "_x ]=], opt)

this line too ]]

map("i", "jk", "<ESC>", opt)
map("n", "<ESC><ESC>", [[<Cmd> nohlsearch <CR>]], opt)
map("n", "<Left>", [[<Cmd>echoe "Use h" <CR>]], opt)
map("n", "<Right>", [[<Cmd>echoe "Use l" <CR>]], opt)
map("n", "<Up>", [[<Cmd>echoe "Use k" <CR>]], opt)
map("n", "<Down>", [[<Cmd>echoe "Use j" <CR>]], opt)


-- OPEN TERMINALS --
map("n", "<C-l>", [[<Cmd>vnew term://zsh <CR>]], opt) -- over right
map("n", "<C-x>", [[<Cmd> split term://zsh | resize 10 <CR>]], opt) --  bottom
map("n", "<C-t>t", [[<Cmd> tabnew | term <CR>]], opt) -- newtab

-- COPY EVERYTHING in the file--
map("n", "<C-a>", [[ <Cmd> %y+<CR>]], opt)

-- toggle numbers ---
map("n", "<leader>n", [[ <Cmd> set nu!<CR>]], opt)

-- toggle truezen.nvim's ataraxis and minimalist mode
map("n", "<leader>z", [[ <Cmd> TZAtaraxis<CR>]], opt)
map("n", "<leader>m", [[ <Cmd> TZMinimalist<CR>]], opt)

map("n", "<C-s>", [[ <Cmd> w <CR>]], opt) -- save

-- spectre
map("n", "<Leader>s", [[ <Cmd> lua require('spectre').open() <CR>]], opt)




