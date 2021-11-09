local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true }
local silent_opts = { noremap = true, silent = true }

-- Remove key mapping for spacebar
keymap('n', '<SPACE>', '<Nop>', opts)

-- Disable wrapped line skips during vertical navigation
keymap('n', 'j', 'gj', opts)
keymap('n', 'k', 'gk', opts)

-- Save & source file
keymap('n', '<C-w>', '<CMD>w | so %<CR>', opts)

-- Delete buffer
keymap('n', '<C-q>', '<CMD>bd<CR>', opts)

-- Save all buffers and exit Vim
keymap('n', 'Q', '<CMD>xa<CR>', opts)

-- Temporarily show file path in status bar
keymap('n', '<LEADER>p', '<CMD>echo expand("%:p")<CR>', silent_opts)

-- Switch between split windows
keymap('n', '<C-h>', '<C-w>h', opts)
keymap('n', '<C-l>', '<C-w>l', opts)
keymap('n', '<C-j>', '<C-w>j', opts)
keymap('n', '<C-k>', '<C-w>k', opts)

-- Use keys 'jk' to exit insert mode
keymap('i', 'jk', '<ESC>', opts)

-- Use keys 'jk' to exit insert mode
keymap('c', 'jk', '<ESC>', opts)

-- TEMP!!!!
keymap('n', 'K', '<CMD>lua vim.lsp.buf.hover()<CR>', silent_opts)
-- keymap('n', '<C-k>', '<CMD>lua vim.lsp.buf.type_definition()<CR>', silent_opts)
-- keymap('n', '<C-n>', '<CMD>lua vim.lsp.buf.rename()<CR>', silent_opts)
-- keymap('n', '<C-k>', '<CMD>lua vim.lsp.buf.code_action()<CR>', silent_opts)
-- keymap('n', '<C-n>', '<CMD>lua vim.lsp.buf.references()<CR>', silent_opts)
-- keymap('n', '[d', '<CMD>lua vim.lsp.diagnostic.goto_prev()<CR>', silent_opts)
-- keymap('n', ']d', '<CMD>lua vim.lsp.diagnostic.goto_next()<CR>', silent_opts)
-- keymap('n', '<LEADER>q', '<CMD>lua vim.lsp.diagnostic.set_loclist()<CR>', silent_opts)
-- keymap('n', '<C-n>', '<CMD>lua vim.lsp.buf.formatting()<CR>', silent_opts)
