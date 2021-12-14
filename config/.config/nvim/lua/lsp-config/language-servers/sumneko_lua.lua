local utils = require 'lsp-config/language-servers/utils'

local system_name

if vim.fn.has 'mac' == 1 then
  system_name = 'macOS'
elseif vim.fn.has 'unix' == 1 then
  system_name = 'Linux'
elseif vim.fn.has 'win32' == 1 then
  system_name = 'Windows'
else
  print 'Unsupported system for sumneko'
end

local sumneko_root_path = '/home/natkiypie/.dotfiles/config/.config/nvim/language-servers/lua-language-server'
local sumneko_binary = sumneko_root_path .. '/bin/' .. system_name .. '/lua-language-server'
local runtime_path = vim.split(package.path, ';')

table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

local on_attach = function(client, bufnr)
  utils.disable_native_formatting(client)
  utils.commands()
  utils.keybindings(bufnr)
  utils.format(client)
end

require('lspconfig')['sumneko_lua'].setup {
  cmd = { sumneko_binary, '-E', sumneko_root_path .. '/main.lua' },
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
        path = runtime_path,
      },
      diagnostics = {
        globals = { 'vim' },
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
  on_attach = on_attach,
}
