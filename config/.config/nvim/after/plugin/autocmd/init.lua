vim.cmd [[
  augroup init
    autocmd!
    autocmd VimEnter * ++once lua require('utils.init').update()
  augroup END
]]
