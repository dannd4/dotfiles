local home_dir = "/Users/dan"
local node_bin = "/.volta/tools/image/node/22.19.0/bin"

vim.cmd("let $PATH = '" .. home_dir .. node_bin .. ":' . $PATH")
