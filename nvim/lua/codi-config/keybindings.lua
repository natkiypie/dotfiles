local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Toggle Codi
keymap('n', '<leader>c', '<CMD>Codi!!<CR>', opts)

