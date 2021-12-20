vim.cmd [[
  augroup nvim_startup
    autocmd!
    autocmd VimEnter * ++once lua require('utils.startup').startup()
  augroup END
]]
