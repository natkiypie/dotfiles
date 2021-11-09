-- :Telescope find_files<cr>"
-- :Telescope live_grep<cr>"
-- nnoremap <Leader>f :lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ winblend = 25 }))<cr>
-- nnoremap <Leader>f :lua require'telescope.builtin'.find_files({ winblend = 25 })<cr>
vim.cmd[[
  nnoremap <Leader>f :lua require'telescope.builtin'.find_files()<cr>
]]
