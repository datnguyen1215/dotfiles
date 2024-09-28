vim.api.nvim_set_keymap("n", "L", ":call VSCodeNotify('workbench.action.nextEditorInGroup')<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "H", ":call VSCodeNotify('workbench.action.previousEditorInGroup')<CR>", { silent = true })

vim.api.nvim_set_keymap("n", "<C-h>", ":call VSCodeNotify('workbench.action.navigateLeft')<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<C-j>", ":call VSCodeNotify('workbench.action.navigateDown')<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<C-k>", ":call VSCodeNotify('workbench.action.navigateUp')<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<C-l>", ":call VSCodeNotify('workbench.action.navigateRight')<CR>", { silent = true })

vim.api.nvim_set_keymap("n", "<leader>cf", ":call VSCodeNotify('editor.action.formatDocument')<CR>", { silent = true })

vim.opt.clipboard:append("unnamedplus")
