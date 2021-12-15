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
  -- Buffer navigation
  { '<S-l>', '<CMD>bn<CR>' },
  { '<S-h>', '<CMD>bp<CR>' },
  -- Split navigation
  { '<', '<C-w>h' },
  { '>', '<C-w>l' },
  { '<Left>', '<C-w>h' },
  { '<Right>', '<C-w>l' },
  { '<Up>', '<C-w>k' },
  { '<Down>', '<C-w>j' },
  -- Split Resize
  { '-', '<CMD>vertical resize -5<CR>' },
  { '=', '<CMD>vertical resize +5<CR>' },
  -- Set current working directory to directory of opened file
  { '++', '<CMD>cd %:h<CR>' },
  -- Surround word under cursor with single quotes
  { "'", '<CMD>lua require"utils.keybindings".quote()<CR>B' },
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

-- make <expr> binding (condition: terminal vsplit)
keys.bind_terminal_mode {
  { '<ESC>', '<C-\\><C-n>' },
}

-- TEST:
-- some other text 'test' "test"

-- NOTES:
-- get word (including quotes) under cursor: echo expand("<cWORD>")
-- get word surrounded by single quotes: echo matchstr(getline('.'), "'\\zs[^']\\+\\ze'")
-- get word surrounded by double quotes: echo matchstr(getline('.'), "'\\zs[^']\\+\\ze'")

-- keys.bind_expr_normal_mode {
--   { '<C-p>', 'v:lua.test()' },
-- }

keys.bind_expr_command_mode {
  { '<C-k>', 'v:lua.wildm("\\<Left\\>")' },
  { '<C-j>', 'v:lua.wildm("\\<Right\\>")' },
  { '<C-h>', 'v:lua.wildm("\\<Up\\>")' },
  { '<C-l>', 'v:lua.wildm("\\<CR\\>")' },
}

keys.bind_expr_terminal_mode {
  { '<', 'v:lua.vsplit_term("\\<C-\\>\\<C-n\\>\\<C-w\\>h")' },
}
