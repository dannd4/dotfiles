local home_dir = "/Users/dan"
local node_bin = "/.volta/tools/image/node/20.11.0/bin"

vim.g.node_host_prog = home_dir .. node_bin .. "/node"
vim.g.copilot_node_command = home_dir .. node_bin .. "/node"

vim.cmd("let $PATH = '" .. home_dir .. node_bin .. ":' . $PATH")

-- Set up custom filetypes
vim.filetype.add {
  filename = {
    [".swcrc"] = "jsonc",
  },
  extension = {
    mdx = "mdx",
  },
}

-- -- Configure treesitter to use the markdown parser for mdx files
vim.treesitter.language.register("markdown", "mdx")
