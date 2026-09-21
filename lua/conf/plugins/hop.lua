return {
  {
    'smoka7/hop.nvim',
    version = "*",
    opts = {
      keys = 'etovxqpdygfblzhckisuran'
    }
  },
  vim.api.nvim_set_keymap('', 'f',
    "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>",
    {}),
  vim.api.nvim_set_keymap('', 'F',
    "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>",
    {}),
  vim.api.nvim_set_keymap('', 't',
    "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })<cr>",
    {}),
  vim.api.nvim_set_keymap('', 'T',
    "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })<cr>",
    {}),
  vim.api.nvim_set_keymap('', '<leader><leader>j', "<cmd>HopWordAC<cr>", { desc = "Hop Word Down" }),
  vim.api.nvim_set_keymap('', '<leader><leader>k', "<cmd>HopWordBC<cr>", { desc = "Hop Word Up" }),
  vim.api.nvim_set_keymap('', '<leader><leader>l', "<cmd>HopPattern<cr>", { desc = "Hop Pattern" }),
}
