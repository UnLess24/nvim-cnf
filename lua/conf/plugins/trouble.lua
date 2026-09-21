return {
  "folke/trouble.nvim",
  opts = {
    -- win = {
    --   type = "split",
    --   position = "right",
    --   size = 0.3,
    -- },
  },
  cmd = "Trouble",
  keys = {
    {
      "<leader>xx",
      "<cmd>Trouble diagnostics toggle<cr>",
      desc = "Diagnostics (Trouble)",
    },
    {
      "<leader>xX",
      "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
      desc = "Buffer Diagnostics (Trouble)",
    },
    {
      "<leader>xs",
      "<cmd>Trouble symbols toggle focus=false<cr>",
      desc = "Symbols (Trouble)",
    },
    {
      "<leader>xl",
      "<cmd>Trouble lsp toggle focus=false<cr>",
      desc = "LSP Definitions / references / ... (Trouble)",
    },
    {
      "<leader>xL",
      "<cmd>Trouble loclist toggle<cr>",
      desc = "Local List (Trouble)",
    },
    {
      "<leader>xQ",
      "<cmd>Trouble qflist toggle<cr>",
      desc = "Quickfix List (Trouble)",
    },
    {
      "<leader>xc",
      "<cmd>Trouble close<cr>",
      desc = "Trouble close (Trouble)",
    },
    {
      "<leader>xt",
      "<cmd>Trouble todo filter = {tag = {YAK,DONE}}<cr>",
      desc = "TODO list (Throuble filter=YAK,DONE)",
    },
  }
}
