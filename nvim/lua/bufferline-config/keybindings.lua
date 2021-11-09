vim.cmd[[
  nnoremap <silent><TAB> :BufferLineCycleNext<CR>
  nnoremap <silent><S-Tab> :BufferLineCyclePrev<CR>
  nnoremap <silent><Leader><Tab> :BufferLineMoveNext<CR>
  nnoremap <silent><Leader><S-Tab> :BufferLineMovePrev<CR>
  nnoremap <silent><C-q> <Cmd>bd<CR>
]]
