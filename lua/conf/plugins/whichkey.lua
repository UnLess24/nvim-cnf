return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
  config = function()
    local wk = require("which-key")
    wk.add({
      { "<leader>p", group = "Telescope" },
      { "<leader>s", group = "Resize window" },
      { "<leader>t", group = "Terminal" },
      { "gh",        group = "Gitsigns" },
      { "<C-w>",     group = "Cursor move between windows" },
    })
  end,
}
