local home_dir = "/Users/dan"
local node_bin = "/.volta/tools/image/node/20.11.0/bin"

vim.g.copilot_node_command = home_dir .. node_bin .. "/node"

vim.cmd("let $PATH = '" .. home_dir .. node_bin .. ":' . $PATH")
