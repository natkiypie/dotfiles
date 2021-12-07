local lsp = vim.lsp
local handlers = lsp.handlers
local pop_opts = { border = 'single', max_width = 80 }

handlers['textDocument/hover'] = lsp.with(handlers.hover, pop_opts)
handlers['textDocument/signatureHelp'] = lsp.with(handlers.signature_help, pop_opts)
-- automatically show hover docs
-- local pop_opts = { border = 'single', max_width = 80, focusable = false }
-- vim.o.updatetime = 400
-- todo: update with better regex
-- vim.cmd [[autocmd CursorHold * lua vim.lsp.buf.hover()]]

-- Set window transparency
-- vim.go.pumblend = 30
-- vim.go.winblend = 30
