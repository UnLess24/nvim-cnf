vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.keymap.set
local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
local function Opts(desc)
  return { noremap = true, silent = true, desc = desc }
end

-- Disable Space in normal and visual modes to prevent accidental movement
map({ "n", "v" }, "<Space>", "<Nop>", opts)

-- Better escape
map("i", "jk", "<Esc>", opts)

-- Move highlighted text up and down in visual mode
map("v", "J", ":m '>+1<CR>gv=gv", opts)
map("v", "K", ":m '<-2<CR>gv=gv", opts)

-- Window navigation and splitting
map("n", "ss", ":split<Return><C-w>j", Opts("Split window horizontally"))
map("n", "sv", ":vsplit<Return><C-w>l", Opts("Split window vertically"))
-- Window resizing
map("n", "<leader>sl", ":vertical resize +10<Return>", Opts("Vertical +10"))
map("n", "<leader>sh", ":vertical resize -10<Return>", Opts("Vertical -10"))
map("n", "<leader>sj", ":horizontal resize +10<Return>", Opts("Horisontal +10"))
map("n", "<leader>sk", ":horizontal resize -10<Return>", Opts("Horisontal -10"))

-- Navigate buffers
map("n", "<S-l>", ":bnext<CR>", Opts("Next buffer"))
map("n", "<S-h>", ":bprevious<CR>", Opts("Previous buffer"))
map("n", "gb", "<C-^>", Opts("Go to previous buffer"))

-- Better search navigation
map("n", "n", "nzzzv", opts)
map("n", "N", "Nzzzv", opts)

-- Terminal window navigation
map("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
map("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
map("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
map("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Half-page jumps up and down
map("n", "<C-d>", "<C-d>zz", opts)
map("n", "<C-u>", "<C-u>zz", opts)

-- Disable Ex mode
map("n", "Q", "<nop>", opts)

-- Copy to system clipboard
map({ "n", "v" }, "<leader>y", '"+y', Opts("Copy to system clipboard"))

-- New terminal in a horizontal / vertical / current window
map("n", "<leader>th", ":20split | terminal<CR><cmd>startinsert<CR>", Opts("20 Horisontal"))
map("n", "<leader>tv", ":80vsplit | terminal<CR><cmd>startinsert<CR>", Opts("80 Vertical"))
map("n", "<leader>tt", ":terminal<CR><cmd>startinsert<CR>", Opts("Open"))

-- Custom command to replace :bd and keep windows open
vim.api.nvim_create_user_command("Bd", function()
  local bufnr = vim.api.nvim_get_current_buf()

  -- Move to the previous buffer
  vim.cmd("bprevious")

  -- If we are still on the same buffer (meaning it was the last open buffer),
  -- create a new empty one to keep the window open
  if bufnr == vim.api.nvim_get_current_buf() then
    vim.cmd("enew")
  end

  -- Delete the original buffer
  vim.cmd("bdelete " .. bufnr)
end, { desc = "Delete buffer but keep window open" })

-- Abbreviate lowercase :bd to call our uppercase :Bd command
vim.cmd("cnoreabbrev <expr> bd getcmdtype() == ':' && getcmdline() == 'bd' ? 'Bd' : 'bd'")

-- Git
map("n", "ghq", ":Gitsigns setqflist<CR>", Opts("Set qfl git hunks"))
map("n", "ghp", ":Gitsigns preview_hunk<CR>", Opts("Preview git hunk"))
map({ "n", "v" }, "ghr", ":Gitsigns reset_hunk<CR>", Opts("Reset hunk"))
map({ "n", "v" }, "ghs", ":Gitsigns stage_hunk<CR>", Opts("Stage hunk"))
map("n", "ghb", ":Gitsigns blame<CR>", Opts("Git blame"))
map("n", "ghbl", ":Gitsigns blame_line<CR>", Opts("Git blame line"))
map("n", "]c", ":Gitsigns next_hunk<CR>", Opts("Next hunk"))
map("n", "[c", ":Gitsigns prev_hunk<CR>", Opts("Prev hunk"))

-- Highlight
map("n", "<C-n>", ":nohls<CR>", Opts("No highlight search"))
map("n", "<leader>*", "*N", Opts("Highlight current word"))

-- Set cursor move between windows to arrow keys
map('n', '<C-k>', '<C-w>k', Opts("Cursor to Up window"))
map('n', '<C-j>', '<C-w>j', Opts("Cursor to Dows window"))
map('n', '<C-h>', '<C-w>h', Opts('Cursor to Left window'))
map('n', '<C-l>', '<C-w>l', Opts('Cursor to Right window'))

-- Indent
map("v", "<", "<gv", Opts("Unindent and keep selection"))
map("v", ">", ">gv", Opts("Indent and keep selection"))
