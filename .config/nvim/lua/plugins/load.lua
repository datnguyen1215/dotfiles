vim.g.mkdp_highlight_css = vim.fn.expand("~/.config/nvim/css/markdown-preview.css")
vim.g.mkdp_browser = "firefox"
vim.g.mkdp_page_title = "${name}"

return {
  {
    "rmagatti/auto-session",
    ---enables autocomplete for opts
    ---@module "auto-session"
    ---@type AutoSession.Config
    opts = {
      suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
      -- log_level = 'debug',
    },
  },

  { "windwp/nvim-ts-autotag" },

  { "catppuccin/nvim", name = "catppuccin" },

  { "github/copilot.vim" },

  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = function()
      require("lazy").load({ plugins = { "markdown-preview.nvim" } })
      vim.fn["mkdp#util#install"]()
    end,
    keys = {
      {
        "<leader>cp",
        ft = "markdown",
        "<cmd>MarkdownPreviewToggle<cr>",
        desc = "Markdown Preview",
      },
    },
    config = function()
      vim.cmd([[do FileType]])
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "shfmt",
        "svelte-language-server",
        "json-lsp",
        "eslint-lsp",
        "prettierd",
        "typescript-language-server",
        "tailwindcss-language-server",
        "sql-formatter",
        "graphql-language-service-cli",
        "python-lsp-server",
        "gopls",
      },
    },
  },

  {
    "folke/noice.nvim",
    opts = {
      lsp = {
        progress = {
          enabled = false,
        },
        message = {
          enabled = false,
        },
      },
      presets = {
        bottom_search = false, -- use a classic bottom cmdline for search
        command_palette = false, -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false, -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = false, -- add a border to hover docs and signature help
      },
      views = {
        cmdline = {
          position = { row = "50%", col = "50%" },
        },
      },
      notify = {
        enabled = false,
      },
      messages = {
        enabled = false,
      },
    },
  },

  {
    "saghen/blink.cmp",
    opts = {
      completion = {
        ghost_text = {
          enabled = false,
        },
      },
    },
  },

  -- disabled packages.
  { "ggandor/flit.nvim", enabled = false },
  { "ggandor/leap.nvim", enabled = false },
  { "folke/flash.nvim", enabled = false },
}
