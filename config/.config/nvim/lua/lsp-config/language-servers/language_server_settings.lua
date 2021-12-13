-- COMMANDS

local commands = function()
  local diagnostics_border = {
    {"┌", "FloatBorder"},
    {"─", "FloatBorder"},
    {"┐", "FloatBorder"},
    {"│", "FloatBorder"},
    {"┘", "FloatBorder"},
    {"─", "FloatBorder"},
    {"└", "FloatBorder"},
    {"│", "FloatBorder"},
  }

  vim.cmd[[
    command! LspDef lua vim.lsp.buf.definition()
    command! LspFormatting lua vim.lsp.buf.formatting()
    command! LspCodeAction lua vim.lsp.buf.code_action()
    command! LspHover lua vim.lsp.buf.hover()
    command! LspRename lua vim.lsp.buf.rename()
    command! LspRefs lua vim.lsp.buf.references()
    command! LspTypeDef lua vim.lsp.buf.type_definition()
    command! LspImplementation lua vim.lsp.buf.implementation()
    command! LspDiag lua vim.diagnostic.show()
    command! LspSignatureHelp lua vim.lsp.buf.signature_help()
  ]]
  vim.cmd('command! LspDiagLine lua vim.diagnostic.open_float({border='..vim.inspect(diagnostics_border)..', focusable=false})')
end

-- KEYBINDINGS

local buf_map = function(bufnr, mode, lhs, rhs, opts)
    vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts or {
        silent = true,
    })
end

local keybindings = function(bufnr)
  buf_map(bufnr, 'n', 'gd', ':LspDef<CR>')
  buf_map(bufnr, 'n', 'gr', ':LspRename<CR>')
  buf_map(bufnr, 'n', 'gy', ':LspTypeDef<CR>')
  buf_map(bufnr, 'n', 'gk', ':LspHover<CR>')
  buf_map(bufnr, 'n', 'ga', ':LspCodeAction<CR>')
  buf_map(bufnr, 'n', 'gl', ':LspDiagLine<CR>')
  buf_map(bufnr, 'n', '<Leader>r', ':LspRestart<CR>')
  buf_map(bufnr, 'i', '<C-f>', '<CMD>LspSignatureHelp<CR>')
end

-- FORMATTING

local formatting = function(client)
  if client.resolved_capabilities.document_formatting then
      vim.cmd('autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()')
  end
end

-- ON ATTACH

local on_attach = function(client, bufnr)
  commands()
  keybindings(bufnr)
  formatting(client)
end

local C = {}

-- TypeScript
C.typescript = {
on_attach = function(client, bufnr)
  client.resolved_capabilities.document_formatting = false
  client.resolved_capabilities.document_range_formatting = false
  on_attach(client, bufnr)
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
  on_attach = on_attach
}

return C
