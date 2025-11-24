-- find uv python path dynamically
local uv_python = vim.fn.systemlist("uv python find")[1]
local uv_python_dir = uv_python:match "(.*/)"

-- find node path dynamically
local node_bin = vim.fn.systemlist("brew --prefix node")[1]
local node_dir = node_bin and (node_bin .. "/bin/") or ""

vim.cmd("let $PATH = '" .. node_dir .. ":' . '" .. uv_python_dir .. ":' . $PATH")
vim.g.python3_host_prog = uv_python
vim.g.copilot_node_command = node_bin
