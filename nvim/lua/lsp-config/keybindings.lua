local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
keymap('n', '<leader>k', '<CMD>lua vim.lsp.buf.hover()<CR>', opts)
