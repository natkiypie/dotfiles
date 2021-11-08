local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true }

-- NATIVE

-- remove key mapping for spacebar
keymap('n', '<SPACE>', '<Nop>', opts)

-- disable wrapped line skips during vertical navigation
keymap('n', 'j', 'gj', opts)
keymap('n', 'k', 'gk', opts)

-- use control j and k to navigate vertically by paragraph
keymap('n', '<C-j>', '<S-}>', opts)
keymap('n', '<C-k>', '<S-{>', opts)

-- use keys 'jk' to exit insert mode
keymap('i', 'jk', '<Esc>', opts)
