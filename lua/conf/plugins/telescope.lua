return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  module = "telescope",
  opts = {
    defaults = {
      layout_strategy = "horizontal",
      sorting_strategy = "ascending",
      winblend = 30,
      layout_config = {
        horizontal = {
          prompt_position = "top",
          preview_width = 0.55,
          results_width = 0.8,
        },
      },
    },
  },
  config = function(_, opts)
    local telescope = require("telescope")
    telescope.setup(opts)

    local builtin = require("telescope.builtin")

    vim.keymap.set("n", "<leader>pg", builtin.git_files, { desc = "Git files" })
    vim.keymap.set("n", "<leader>pr", builtin.live_grep, { desc = "Live Grep" })
    vim.keymap.set("n", "<leader>pf", builtin.find_files, { desc = "Find Files" })
    vim.keymap.set("n", "<leader>pb", builtin.buffers, { desc = "Buffers" })
    vim.keymap.set("n", "<leader>fh", ":Telescope find_files hidden=true <CR>", { desc = "Find Files" })
    vim.keymap.set("n", "<leader>/", builtin.current_buffer_fuzzy_find, { desc = "Current Buffer Fuzzy Find" })
    vim.keymap.set("n", "<leader>pk", ":Telescope keymaps <CR>", { desc = "Keymap" })
  end,
}
