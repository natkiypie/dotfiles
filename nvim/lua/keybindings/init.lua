local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true }

-- Remove key mapping for spacebar
keymap('n', '<SPACE>', '<Nop>', opts)

-- Disable wrapped line skips during vertical navigation
keymap('n', 'j', 'gj', opts)
keymap('n', 'k', 'gk', opts)

-- Use control j and k to navigate vertically by paragraph
keymap('n', '<C-j>', '<S-}>', opts)
keymap('n', '<C-k>', '<S-{>', opts)

-- Use keys 'jk' to exit insert mode
keymap('i', 'jk', '<Esc>', opts)

-- TEMP!!!!
keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
