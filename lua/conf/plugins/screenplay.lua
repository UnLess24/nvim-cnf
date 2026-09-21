return {
  "NStefan002/screenkey.nvim",
  lazy = false,
  version = "*", -- or branch = "main", to use the latest commit
  config = function()
    vim.api.nvim_create_autocmd('VimEnter', {
      callback = function()
        vim.cmd("Screenkey")
      end,
    })
  end,
}
