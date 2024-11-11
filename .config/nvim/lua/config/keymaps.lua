-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Split horizontally
vim.api.nvim_set_keymap("n", "<leader>s", ":vs<CR>", { silent = true })

-- Split vertically
vim.api.nvim_set_keymap("n", "<leader>S", ":split<CR>", { silent = true })

vim.api.nvim_set_keymap("n", "<leader>oil", ":Octo issue list<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<leader>oic", ":Octo issue create<CR>", { silent = true })

vim.api.nvim_set_keymap("n", "<leader>opl", ":Octo pr list<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<leader>opc", ":Octo pr create<CR>", { silent = true })

vim.api.nvim_set_keymap("n", "y", '"+y', { noremap = true })
vim.api.nvim_set_keymap("v", "y", '"+y', { noremap = true })

vim.api.nvim_set_keymap(
  "n",
  "<leader>hx",
  ':lua require("harpoon.mark").add_file()<CR>',
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap("n", "<leader>fh", ":Telescope harpoon marks<CR>", { noremap = true, silent = true })
-- quick navigation
vim.api.nvim_set_keymap(
  "n",
  "<leader>he",
  ":lua require('harpoon.ui').toggle_quick_menu()<CR>",
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>1",
  ':lua require("harpoon.ui").nav_file(1)<CR>',
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>2",
  ':lua require("harpoon.ui").nav_file(2)<CR>',
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>3",
  ':lua require("harpoon.ui").nav_file(3)<CR>',
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>4",
  ':lua require("harpoon.ui").nav_file(4)<CR>',
  { noremap = true, silent = true }
)

-- Function to move to the previous paragraph and skip over folds
local function skip_paragraph_backwards()
  local start_line = vim.fn.line(".")
  local current_fold_closed = vim.fn.foldclosed(start_line) ~= -1

  repeat
    vim.cmd("normal! {")
  until vim.fn.foldclosed(vim.fn.line(".")) == -1 or current_fold_closed

  -- Check if it's necessary to stay within the same paragraph
  if vim.fn.foldclosed(vim.fn.line(".")) ~= -1 then
    vim.cmd("normal! zj")
  end
end

-- Function to move to the next paragraph and skip over folds
local function skip_paragraph_forwards()
  local start_line = vim.fn.line(".")
  local current_fold_closed = vim.fn.foldclosed(start_line) ~= -1

  repeat
    vim.cmd("normal! }")
  until vim.fn.foldclosed(vim.fn.line(".")) == -1 or current_fold_closed

  -- Check if it's necessary to stay within the same paragraph
  if vim.fn.foldclosed(vim.fn.line(".")) ~= -1 then
    vim.cmd("normal! zk")
  end
end

-- Map the functions to { and } keys
vim.keymap.set("n", "{", skip_paragraph_backwards, { noremap = true, silent = true })
vim.keymap.set("n", "}", skip_paragraph_forwards, { noremap = true, silent = true })

vim.keymap.set("v", "<leader>d", function()
  -- Yank the visual selection to register
  vim.cmd('normal! "vy')

  -- Get the yanked text from register v
  local pattern = vim.fn.getreg("v"):gsub("\n", "\\n")

  -- Delete lines globally matching the pattern
  vim.cmd("%g/" .. vim.fn.escape(pattern, "\\") .. "/d")
end, { noremap = true, silent = true })
