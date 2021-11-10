require('lsp-config/cmp')
require('lsp-config/diagnostic_signs')
require('lsp-config/language_servers')

local lsp = vim.lsp
local handlers = lsp.handlers

-- Hover doc popup
local pop_opts = { border = "single", background_color = "white", max_width = 80, focusable = false }
handlers["textDocument/hover"] = lsp.with(handlers.hover, pop_opts)
handlers["textDocument/signatureHelp"] = lsp.with(handlers.signature_help, pop_opts)

vim.o.updatetime = 400
-- todo: update with better regex
vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.lsp.buf.hover()]]
