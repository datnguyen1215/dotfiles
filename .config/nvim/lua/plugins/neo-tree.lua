return {
  "nvim-neo-tree/neo-tree.nvim",
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
