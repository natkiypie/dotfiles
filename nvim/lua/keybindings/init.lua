local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true }
local silent_opts = { noremap = true, silent = true }

-- Remove key mapping for spacebar
-- keymap('n', '<SPACE>', '<Nop>', silent_opts)
keymap('n', '<C-T>', '<Nop>', silent_opts)

-- Disable wrapped line skips during vertical navigation
keymap('n', 'j', 'gj', opts)
keymap('n', 'k', 'gk', opts)

-- Save & Source file
keymap('n', '<C-w>', '<CMD>w | so %<CR>', opts)
-- Source file
keymap('n', '<C-s>', '<CMD>so %<CR>', opts)

-- Close all floating windows & delete buffer (use with auto hover docs)
-- keymap('n', '<C-q>', '<CMD>lua require"keybindings.utils.close".close_float_win()<CR>', silent_opts)
keymap('n', '<C-q>', '<CMD>bd!<CR>', silent_opts)

-- Save all buffers and exit Vim
keymap('n', 'Q', '<CMD>xa<CR>', opts)

-- Temporarily show file path in status bar
keymap('n', '<C-p>', '<CMD>echo expand("%:p")<CR>', silent_opts)

-- Switch between split windows
keymap('n', '<C-h>', '<C-w>h', opts)
keymap('n', '<C-l>', '<C-w>l', opts)
keymap('n', '<C-j>', '<C-w>j', opts)
keymap('n', '<C-k>', '<C-w>k', opts)

-- move current line down
keymap('n', '<C-J>', '<CMD>m+1<CR>', opts)
-- move current line up
keymap('n', '<C-K>', '<CMD>m-2<CR>', opts)

-- UNTIL I MAKE A TOGGLE UTIL FUNCTION
-- enable mouse
keymap('n', '<C-M>', '<CMD>set mouse="a"<CR>', opts)

-- disable mouse
keymap('n', '<C-m>', '<CMD>set mouse=""<CR>', opts)

-- Use keys 'jk' to exit insert mode
keymap('i', 'jk', '<ESC>', opts)

-- Use keys 'jk' to exit insert mode
keymap('c', 'jk', '<ESC>', silent_opts)
