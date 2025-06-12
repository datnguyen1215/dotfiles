-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.mapleader = ";"

-- disable keymaps that conflict with LazyVim
vim.opt.clipboard = ""

-- disable autoformatting on save
vim.g.autoformat = false

-- Set the default colors for the Ufo line count
vim.api.nvim_command("highlight UfoLineCountGroup guifg=#000000 guibg=#efb700 gui=bold")
