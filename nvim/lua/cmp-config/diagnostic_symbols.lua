-- Source: https://github.com/neovim/nvim-lspconfig/wiki/UI-customization
local signs = { Error = " ", Warn = " ", Hint = "ﳞ ", Info = " " }

for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
