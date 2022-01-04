local M = {}

local function highlight(client)
  if client.resolved_capabilities.document_highlight then
    vim.o.updatetime = 400
    vim.cmd [[
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]]
  end
end

local function disable_native_formatting(client)
  client.resolved_capabilities.document_formatting = false
  client.resolved_capabilities.document_range_formatting = false
end

local function ts_utils(client, bufnr)
  local ts_utils = require 'nvim-lsp-ts-utils'
  ts_utils.setup {}
  ts_utils.setup_client(client)
  require('lsp-config.keybindings').ts_bind(bufnr)
end

M.on_attach_typescript = function(client, bufnr)
  require('lsp-config.keybindings').bind(bufnr)
  disable_native_formatting(client)
  highlight(client)
  ts_utils(client, bufnr)
end

M.on_attach_html = function(client, bufnr)
  require('lsp-config.keybindings').bind(bufnr)
  disable_native_formatting(client)
  highlight(client)
end

M.on_attach_css = function(client, bufnr)
  require('lsp-config.keybindings').bind(bufnr)
  disable_native_formatting(client)
end

return M
