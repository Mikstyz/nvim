local lspconfig = require("lspconfig")

-- Включаем LSP для нужных языков
lspconfig.pyright.setup{}  -- Python
lspconfig.gopls.setup{}    -- Go
lspconfig.omnisharp.setup{ -- C#
  cmd = { "omnisharp", "--languageserver", "--hostPID", tostring(vim.fn.getpid()) },
}
