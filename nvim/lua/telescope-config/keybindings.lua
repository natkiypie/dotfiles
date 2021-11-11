local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

keymap('n', '<LEADER>f', "<CMD>Telescope find_files<CR>", opts)
keymap('n', '<LEADER>g', "<CMD>Telescope live_grep<CR>", opts)
keymap('n', '<LEADER>o', "<CMD>Telescope oldfiles<CR>", opts)

-- TODO:
-- make picker for ":h index" (lists all key mappings)

