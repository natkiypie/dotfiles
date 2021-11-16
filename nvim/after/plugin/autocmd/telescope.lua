-- If no file is passed to vim, open telescope find files picker
vim.cmd([[autocmd VimEnter * if empty(bufname()) == 1 | call nvim_command('Telescope find_files') | endif]])
