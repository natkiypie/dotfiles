require('plugins')
require('keybindings')
require('options')
require('treesitter-config')
require('telescope-config')
require('comment-config')
require('colors')
require('bufferline-config')
require('autopairs-config')
require('blankline-config')
require('lsp-config')

-- If no file is passed to vim, open telescope find files picker
-- Note: I'm sure there's a better place to put this. Baby steps.
vim.cmd([[autocmd VimEnter * if empty(bufname()) == 1 | call nvim_command('Telescope find_files') | endif]])
