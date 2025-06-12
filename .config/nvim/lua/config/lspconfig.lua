local lspconfig = require("lspconfig")

lspconfig.ts_ls.setup({
  settings = {
    diagnostics = {
      ignoredCodes = { 7016, 80001, 7044, 7047 },
    },
  },
})
