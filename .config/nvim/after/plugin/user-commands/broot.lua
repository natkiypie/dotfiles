local group = vim.api.nvim_create_augroup('Broot', { clear = true })

vim.api.nvim_create_autocmd('VimEnter', {
  callback = function()
    if vim.fn.argc() == 0 then
      require('scripts.terminals.broot').open()
    end
  end,
  group = group,
})
