return {
  "nvim-mini/mini.nvim",
  version = false,
  config = function()
    ---- mini notify ----
    require("mini.notify").setup({
      -- only show messages
      content = {
        format = function(notif)
          return notif.msg
        end,
      },
    })

    --- mini cmdline completion ---
    require("mini.cmdline").setup({
      autocorrect = { enable = false }
    })

    --- mini surround ---
    require("mini.surround").setup()
    -- Default Keymaps
    -- | `sa` | Add surrounding or Direct with 'saiw' |
    -- | `sd` | Delete surrounding |
    -- | `sr` | Replace surrounding |
    -- | `sf` | Find surrounding (right) |
    -- | `sF` | Find surrounding (left) |
    -- | `sh` | Highlight surrounding |
    -- | `sn` | Update n_lines |
    -- | `l` / `n` | as suffix for prev/next |

    --- mini completions ---
    require("mini.completion").setup({
      lsp_completion = {
        auto_setup = true,
      }
    })

    --- mini diff and fugitive ---
    local MiniDiff = require("mini.diff")
    MiniDiff.setup({
      source = MiniDiff.gen_source.git({ index = false }),
    })

    -- require("mini.jump").setup()
  end,
}
