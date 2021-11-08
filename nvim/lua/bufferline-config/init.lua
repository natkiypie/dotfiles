require("bufferline").setup({
  options = {
    enforce_regular_tabs = true,
    separator_style = "padded_slant"
  }
})

-- KEYBINDINGS

vim.cmd[[
  nnoremap <silent><TAB> :BufferLineCycleNext<CR>
  nnoremap <silent><C-b> :BufferLineCyclePrev<CR>
  nnoremap <silent><Leader><Tab> :BufferLineMoveNext<CR>
  nnoremap <silent><Leader><C-b> :BufferLineMovePrev<CR>
  nnoremap <silent><leader>1 <Cmd>BufferLineGoToBuffer 1<CR>
  nnoremap <silent><leader>2 <Cmd>BufferLineGoToBuffer 2<CR>
  nnoremap <silent><leader>3 <Cmd>BufferLineGoToBuffer 3<CR>
  nnoremap <silent><leader>4 <Cmd>BufferLineGoToBuffer 4<CR>
  nnoremap <silent><leader>5 <Cmd>BufferLineGoToBuffer 5<CR>
  nnoremap <silent><leader>6 <Cmd>BufferLineGoToBuffer 6<CR>
  nnoremap <silent><leader>7 <Cmd>BufferLineGoToBuffer 7<CR>
  nnoremap <silent><leader>8 <Cmd>BufferLineGoToBuffer 8<CR>
  nnoremap <silent><leader>9 <Cmd>BufferLineGoToBuffer 9<CR>
  nnoremap <silent><leader>q <Cmd>bd<CR>
]]
