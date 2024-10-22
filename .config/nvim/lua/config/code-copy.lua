function CopyRangeToClipboard(start_line, end_line)
  local file_path = vim.fn.expand("%:p")
  local lines = vim.fn.getline(start_line, end_line)
  local clipboard_content = string.format("File: %s\nLines: %d-%d\n", file_path, start_line, end_line)

  for i, line in ipairs(lines) do
    clipboard_content = clipboard_content .. string.format("%d: %s\n", start_line + i - 1, line)
  end

  vim.fn.setreg("+", clipboard_content)
  print("Range copied to clipboard with file path and line numbers.")
end

-- Command to call the function with a visual selection
vim.api.nvim_set_keymap(
  "v",
  "<leader>y",
  [[:<C-U>lua CopyRangeToClipboard(vim.fn.line("'<"), vim.fn.line("'>"))<CR>]],
  { noremap = true, silent = true }
)
