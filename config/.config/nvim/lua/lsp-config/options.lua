local lsp = vim.lsp
local handlers = lsp.handlers
local opts = { border = 'single', max_width = 80 }
handlers['textDocument/hover'] = lsp.with(handlers.hover, opts)
handlers['textDocument/signatureHelp'] = lsp.with(handlers.signature_help, opts)
