-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("config.copilot")
require("config.cmp")
require("config.telescope")
require("config.colorscheme")
require("config.tsserver")
require("config.gitsigns")
require("config.mapleader")
require("config.keymaps")
require("buffermind")
vim.g.autoformat = false
vim.api.nvim_command("highlight UfoLineCountGroup guifg=#000000 guibg=#efb700 gui=bold")
