-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.api.nvim_set_keymap("n", "<leader>s", ":vs<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<leader>S", ":split<CR>", { silent = true })

vim.api.nvim_set_keymap("n", "y", '"+y', { noremap = true })
vim.api.nvim_set_keymap("v", "y", '"+y', { noremap = true })

vim.keymap.set("v", "<leader>d", function()
  -- Yank the visual selection to register
  vim.cmd('normal! "vy')

  -- Get the yanked text from register v
  local pattern = vim.fn.getreg("v"):gsub("\n", "\\n")

  -- Delete lines globally matching the pattern
  vim.cmd("%g/" .. vim.fn.escape(pattern, "\\") .. "/d")
end, { noremap = true, silent = true })
