vim.cmd [[
  augroup vim_enter
    autocmd!
    autocmd VimEnter * ++once lua require('scripts.vimenter').check_flag()
  augroup END
]]
