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

-- Close all floating windows & delete buffer
-- use with auto hover docs
keymap('n', '<C-q>', '<CMD>lua require"keybindings.utils.close".close_float_win()<CR>', silent_opts)

-- Save all buffers and exit Vim
keymap('n', 'Q', '<CMD>xa<CR>', opts)

-- Temporarily show file path in status bar
keymap('n', '<C-p>', '<CMD>echo expand("%:p")<CR>', silent_opts)

-- Switch between split windows
keymap('n', '<C-h>', '<C-w>h', opts)
keymap('n', '<C-l>', '<C-w>l', opts)
keymap('n', '<C-j>', '<C-w>j', opts)
keymap('n', '<C-k>', '<C-w>k', opts)

-- Use keys 'jk' to exit insert mode
keymap('i', 'jk', '<ESC>', opts)

-- Use keys 'jk' to exit insert mode
keymap('c', 'jk', '<ESC>', opts)

-- TODO
-- toggle terminal
-- toggle mouse on and off
-- move line down: <CMD>m+1<CR>
-- move line up: <CMD>m-2<CR>
