
local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

keymap('n', '<C-t>', '<CMD>FloatermToggle<CR>', opts)
keymap('t', '<C-t>', '<CMD>FloatermToggle<CR>', opts)
keymap('t', '<C-n>', '<CMD>FloatermNew<CR>', opts)
keymap('t', '<C-h>', '<CMD>FloatermPrev<CR>', opts)
keymap('t', '<C-l>', '<CMD>FloatermNext<CR>', opts)
keymap('t', '<C-q>', '<CMD>FloatermKill<CR>', opts)
keymap('t', '<ESC>', '<CMD>FloatermKill!<CR>', opts)
