return {
  "nvim-neo-tree/neo-tree.nvim",
  init = function()
    -- FIX: use `autocmd` for lazy-loading neo-tree instead of directly requiring it,
    -- because `cwd` is not set up properly.
    vim.api.nvim_create_autocmd("BufEnter", {
      group = vim.api.nvim_create_augroup("Neotree_start_directory", { clear = true }),
      desc = "Start Neo-tree with directory",
      once = true,
      callback = function()
        if vim.fn.isdirectory(vim.fn.expand("%")) == 1 then
          vim.cmd("ene")
        end
      end,
    })
  end,
  opts = {
    filesystem = {
      bind_to_cwd = true,
      window = {
        mappings = {
          ["/"] = "",
        },
      },
    },
    default_component_configs = {
      git_status = {
        symbols = {
          -- Change type
          added = "+", -- or "✚", but this is redundant info if you use git_status_colors on the name
          modified = "M", -- or "", but this is redundant info if you use git_status_colors on the name
          deleted = "-", -- this can only be used in the git_status source
          renamed = "", -- this can only be used in the git_status source
          -- Status type
          untracked = "U",
          ignored = "",
          unstaged = "",
          staged = "",
          conflict = "C",
        },
      },
    },
  },
  keys = {
    {
      "<C-n>",
      function()
        require("neo-tree.command").execute({ toggle = true, dir = vim.loop.cwd() })
      end,
      desc = "Explorer NeoTree (cwd)",
    },
  },
}
