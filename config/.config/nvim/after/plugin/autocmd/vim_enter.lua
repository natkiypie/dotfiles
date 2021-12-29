vim.cmd [[
  augroup vim_enter
    autocmd!
    autocmd VimEnter * ++once lua require('scripts.initialize').check_flag()
  augroup END
]]
