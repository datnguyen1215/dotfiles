-- UFO folding
vim.o.foldcolumn = "1" -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99

local fold_descendants = function()
  local ts_utils = require("nvim-treesitter.ts_utils")
  local current_node = ts_utils.get_node_at_cursor()
  if not current_node then
    print("No current node found")
    return
  end

  -- Expand to the nearest enclosing foldable node
  while current_node and not current_node:named() do
    current_node = current_node:parent()
  end

  if not current_node then
    print("No foldable node found")
    return
  end

  -- Collect and fold all child nodes
  local nodes = {}
  local function collect_nodes(node)
    table.insert(nodes, node)
    for child in node:iter_children() do
      collect_nodes(child)
    end
  end

  collect_nodes(current_node)

  -- Fold nodes in reverse order (deepest first)
  for i = #nodes, 1, -1 do
    local node = nodes[i]
    local start_line = node:start() + 1
    local end_line = node:end_() + 1
    if start_line < end_line then
      vim.cmd(start_line .. "," .. end_line .. "fold")
    end
  end
end

local handler = function(virtText, lnum, endLnum, width, truncate)
  local newVirtText = {}
  local lastText = vim.fn.getline(endLnum):gsub("^%s*(.-)%s*$", "%1")
  local lineCountText = ("󰁂 %d lines"):format(endLnum - lnum)
  local suffix = (" %s      %s"):format(lastText, lineCountText)
  local sufWidth = vim.fn.strdisplaywidth(suffix)
  local targetWidth = width - sufWidth
  local curWidth = 0
  for _, chunk in ipairs(virtText) do
    local chunkText = chunk[1]
    local chunkWidth = vim.fn.strdisplaywidth(chunkText)
    if targetWidth > curWidth + chunkWidth then
      table.insert(newVirtText, chunk)
    else
      chunkText = truncate(chunkText, targetWidth - curWidth)
      local hlGroup = chunk[2]
      table.insert(newVirtText, { chunkText, hlGroup })
      chunkWidth = vim.fn.strdisplaywidth(chunkText)
      -- str width returned from truncate() may less than 2nd argument, need padding
      if curWidth + chunkWidth < targetWidth then
        suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
      end
      break
    end
    curWidth = curWidth + chunkWidth
  end
  table.insert(newVirtText, { (" %s      "):format(lastText), "UfoSuffixGroup" })
  table.insert(newVirtText, { lineCountText, "UfoLineCountGroup" })
  return newVirtText
end

return {
  -- UFO folding
  {
    "kevinhwang91/nvim-ufo",
    dependencies = {
      "kevinhwang91/promise-async",
    },
    event = "BufReadPost",
    opts = {
      provider_selector = function()
        return { "treesitter", "indent" }
      end,

      fold_virt_text_handler = handler,
    },

    init = function()
      vim.keymap.set("n", "zC", fold_descendants, { noremap = true, silent = true })

      vim.keymap.set("n", "zR", function()
        require("ufo").openAllFolds()
      end)
      vim.keymap.set("n", "zM", function()
        require("ufo").closeAllFolds()
      end)
      vim.keymap.set("v", "zc", function()
        -- fold the selected text
        vim.cmd("normal! zf")
      end)
    end,
  },
  -- Folding preview, by default h and l keys are used.
  -- On first press of h key, when cursor is on a closed fold, the preview will be shown.
  -- On second press the preview will be closed and fold will be opened.
  -- When preview is opened, the l key will close it and open fold. In all other cases these keys will work as usual.
  { "anuvyklack/fold-preview.nvim", dependencies = "anuvyklack/keymap-amend.nvim", config = true },
}
