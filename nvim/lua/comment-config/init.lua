require('nvim_comment').setup({create_mappings = false})

vim.cmd[[
  nnoremap <C-_> :CommentToggle<CR>
  vnoremap <C-_> :CommentToggle<CR>
]]
