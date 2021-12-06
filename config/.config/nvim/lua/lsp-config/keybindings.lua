local keys = require'utils.keybindings'

keys.bind_normal_mode({
  {'<leader>k', '<CMD>lua vim.lsp.buf.hover()<CR>'},
  {'<leader>r', '<CMD>LspRestart<CR>'},
})
