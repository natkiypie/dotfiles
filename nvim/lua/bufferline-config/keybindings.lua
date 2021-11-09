local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

keymap('n', '<TAB>', '<CMD>BufferLineCycleNext<CR>', opts)
keymap('n', '<S-TAB>', '<CMD>BufferLineCyclePrev<CR>', opts)
keymap('n', '<LEADER><TAB>', '<CMD>BufferLineMoveNext<CR>', opts)
keymap('n', '<LEADER><S-TAB>', '<CMD>BufferLineMovePrev<CR>', opts)
