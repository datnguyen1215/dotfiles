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
