local K = require('utils.init')

K.bind_normal_mode({
  -- Show hover docs
  {'<leader>k', '<CMD>lua vim.lsp.buf.hover()<CR>'}
})
