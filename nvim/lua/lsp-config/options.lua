local lsp = vim.lsp
local handlers = lsp.handlers
local pop_opts = { border = 'single', max_width = 80, winblend = 100 }

-- hi FloatBorder guifg=red

handlers["textDocument/hover"] = lsp.with(handlers.hover, pop_opts)
handlers["textDocument/signatureHelp"] = lsp.with(handlers.signature_help, pop_opts)

-- automatically show hover docs
-- local pop_opts = { border = 'single', max_width = 80, focusable = false }
-- vim.o.updatetime = 400
-- todo: update with better regex
-- vim.cmd [[autocmd CursorHold * lua vim.lsp.buf.hover()]]
