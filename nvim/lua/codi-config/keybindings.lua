local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Run Codi
-- TODO: disable blankline when running Codi
keymap('n', '<C-c>', '<CMD>Codi<CR>', opts)

-- Close Codi
-- temporary - until i make toggle util function
keymap('n', '<C-c>c', '<CMD>Codi!<CR>', opts)

