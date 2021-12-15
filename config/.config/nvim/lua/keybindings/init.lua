local keys = require 'utils.keybindings'

keys.bind_normal_mode {
  -- Disable wrapped line skips during vertical navigation
  { 'j', 'gj' },
  { 'k', 'gk' },
  -- Save & Source file
  { '<C-w>', '<CMD>w | so %<CR>' },
  -- Close all floating windows & delete buffer
  { 'q', '<CMD>lua require"utils.global".close_float_win()<CR>' },
  -- Save all buffers and exit Vim
  { '<C-q>', '<CMD>wa | qa<CR>' },
  -- Used to quit splits
  { 'Q', '<CMD>q<CR>' },
  -- -- Toggle mouse
  { 'M', '<CMD>lua require"utils.global".toggle_mouse()<CR>' },
  -- Temporarily show file path in status bar
  { '<Leader>p', '<CMD>lua require"utils.global".toggle_path()<CR>' },
  -- Split window vertically right
  { '<Leader>v', '<CMD>vsp<CR>' },
  -- Split window horizontally
  { '<Leader>s', '<CMD>sp<CR>' },
  -- Buffer navigation
  { '<S-l>', '<CMD>bn<CR>' },
  { '<S-h>', '<CMD>bp<CR>' },
  -- Set current working directory to directory of opened file
  { '<Leader>h', '<CMD>cd %:h<CR>' },
  -- Surround word under cursor with single quotes
  { "'", '<CMD>lua require"utils.global".quote()<CR>B' },
  -- Yank paragraph and put
  { 'ypp', '}o<ESC>2kyip}pzz' },
}

keys.bind_insert_mode {
  { 'jk', '<ESC>' },
}

-- Surround visual selection with single quotes
keys.bind_visual_mode {
  { "'", "c''<Esc>P" },
  { '"', 'c""<Esc>P' },
}

keys.bind_command_mode {
  { 'jk', '<ESC><C-l>' },
}

keys.bind_terminal_mode {
  { '<ESC>', '<C-\\><C-n>' },
}

keys.bind_expr_normal_mode {
  { '>', 'v:lua.vsplit("\\<C-w\\>l", ">")' },
  { '<', 'v:lua.vsplit("\\<C-w\\>h", "<")' },
  { '<Left>', 'v:lua.vsplit("\\<C-w\\>h", "<Left>")' },
  { '<Right>', 'v:lua.vsplit("\\<C-w\\>l", "<Right>")' },
  { 'K', 'v:lua.split("\\<C-w\\>k", "K")' },
  { 'J', 'v:lua.split("\\<C-w\\>j", "J")' },
  { '<Up>', 'v:lua.split("\\<C-w\\>k", "<Up>")' },
  { '<Down>', 'v:lua.split("\\<C-w\\>j", "<Down>")' },
  { '-', 'v:lua.vsplit("\\<CMD\\>vertical resize -5\\<CR\\>", "-")' },
  { '=', 'v:lua.vsplit("\\<CMD\\>vertical resize +5\\<CR\\>", "=")' },
  { '_', 'v:lua.split("\\<CMD\\>resize -5\\<CR\\>", "_")' },
  { '+', 'v:lua.split("\\<CMD\\>resize +5\\<CR\\>", "+")' },
}

keys.bind_expr_command_mode {
  { '<C-k>', 'v:lua.wildmenu("\\<Left\\>")' },
  { '<C-j>', 'v:lua.wildmenu("\\<Right\\>")' },
  { '<C-h>', 'v:lua.wildmenu("\\<Up\\>")' },
  { '<C-l>', 'v:lua.wildmenu("\\<CR\\>")' },
}

keys.bind_expr_terminal_mode {
  { '<', 'v:lua.repl_vsplit("\\<C-\\>\\<C-n\\>\\<C-w\\>h", "<")' },
}
