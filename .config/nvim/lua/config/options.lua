-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.mapleader = ";"

vim.opt.clipboard = ""
vim.o.sessionoptions = vim.o.sessionoptions:gsub("folds", "")
vim.o.cursorline = false

-- create new files in the directory of the current buffer
--
local Path = require("plenary.path")

-- Function to create a new file in the directory of the current buffer
local function create_new_file_in_buffer_dir()
  -- Get the current buffer's file path
  local current_file = vim.fn.expand("%:p")
  local current_dir = Path:new(current_file):parent().filename

  -- Prompt for the new file name
  local new_file_name = vim.fn.input("New file name: ", "", "file")

  if new_file_name == "" then
    return
  end

  -- Generate the full path for the new file
  local new_file_path = Path:new(current_dir, new_file_name).filename

  -- Open the new file
  vim.cmd("e " .. new_file_path)
end

-- Bind the function to a keymap, for example, <leader>nf
vim.keymap.set("n", "<leader>nf", create_new_file_in_buffer_dir, { noremap = true, silent = true })

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*",
  callback = function()
    if vim.fn.isdirectory(vim.fn.expand("%")) == 1 then
      vim.cmd("cd " .. vim.fn.expand("%")) -- Change directory to the opened directory
      vim.cmd("enew") -- Open a new empty buffer
      vim.cmd("bdelete #") -- Delete the previous buffer
    end
  end,
})

-- Function to get the last segment of the current Neovim working directory
local function get_last_dir_name()
  local cwd = vim.fn.getcwd()
  return vim.fn.fnamemodify(cwd, ":t")
end

-- Function to rename the tmux session
local function rename_tmux_session()
  local session_name = get_last_dir_name()
  -- Check if running inside tmux
  if os.getenv("TMUX") then
    -- Use os.execute to run tmux command.
    os.execute("tmux rename-window " .. session_name)
  end
end

-- Set up an autocommand for VimEnter to rename the session when Neovim starts
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    rename_tmux_session()
  end,
})

vim.api.nvim_create_autocmd("VimLeave", {
  callback = function()
    os.execute("tmux rename-window " .. "bash")
  end,
})
