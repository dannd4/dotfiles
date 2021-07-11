return {
  {
    "jackmort/chatgpt.nvim", -- AI programming
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    cmd = { "ChatGPT", "ChatGPTActAs", "ChatGPTEditWithInstructions" },
    opts = {
      welcome_message = "",
      answer_sign = "",
      question_sign = "",
      chat_layout = {
        size = {
          height = "85%",
          width = "85%",
        },
      },
      chat_window = {
        win_options = {
          winblend = 0,
          winhighlight = "Normal:ChatGPTWindow,FloatBorder:FloatBorder",
        },
      },
      chat_input = {
        prompt = "   ",
        win_options = {
          winblend = 0,
          winhighlight = "Normal:ChatGPTPrompt,ChatGPTPrompt:FloatBorder",
        },
      },
      keymaps = {
        submit = "<C-t>",
        close = { "<esc><esc>" }
      }
    },
  },
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
      copilot_node_command = "/opt/homebrew/Cellar/node/19.8.1/bin/node",
    },
  },
}
