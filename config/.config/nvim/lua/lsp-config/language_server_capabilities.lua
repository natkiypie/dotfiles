local buffer = require'lsp-config.keybindings'

local C = {}

-- General
C.general = require'cmp_nvim_lsp'.update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- TypeScript
C.typescript = {
on_attach = function(client, bufnr)
  client.resolved_capabilities.document_formatting = false
  client.resolved_capabilities.document_range_formatting = false
  local ts_utils = require('nvim-lsp-ts-utils')
  ts_utils.setup({
      eslint_bin = 'eslint_d',
      eslint_enable_diagnostics = true,
      eslint_enable_code_actions = true,
      enable_formatting = true,
      formatter = 'prettierd',
  })
  ts_utils.setup_client(client)
  buffer.buf_map(bufnr, 'n', 'gs', ':TSLspOrganize<CR>')
  buffer.buf_map(bufnr, 'n', 'gi', ':TSLspRenameFile<CR>')
  buffer.buf_map(bufnr, 'n', 'go', ':TSLspImportAll<CR>')
  buffer.on_attach(client, bufnr)
  -- Highlight symbol under cursor: https://github.com/neovim/nvim-lspconfig/wiki/UI-customization#highlight-symbol-under-cursor
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
end,
}

-- Null-LS
C.null_ls =  { on_attach = buffer.on_attach }

-- Sumneko
local system_name
if vim.fn.has('mac') == 1 then
  system_name = 'macOS'
elseif vim.fn.has('unix') == 1 then
  system_name = 'Linux'
elseif vim.fn.has('win32') == 1 then
  system_name = 'Windows'
else
  print('Unsupported system for sumneko')
end

local sumneko_root_path = '/home/natkiypie/.dotfiles/config/.config/nvim/language-servers/lua-language-server'
local sumneko_binary = sumneko_root_path..'/bin/'..system_name..'/lua-language-server'
local runtime_path = vim.split(package.path, ';')

table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

C.sumneko = {
  cmd = {sumneko_binary, '-E', sumneko_root_path .. '/main.lua'},
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
        path = runtime_path,
      },
      diagnostics = {
        globals = {'vim'},
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file('', true),
        checkThirdParty = false,
      },
      telemetry = {
        enable = false,
      },
    },
  },
  on_attach = buffer.on_attach
}

return C
