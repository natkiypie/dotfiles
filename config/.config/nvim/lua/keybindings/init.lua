local keys = require 'utils.keybindings'

keys.bind_normal_mode {
  { 'j', 'gj' },
  { 'k', 'gk' },
  { '<C-w>', '<CMD>w<CR>' },
  { 'q', '<CMD>lua require"utils.global".close_float_win()<CR>' },
  { '<C-q>', '<CMD>lua require"utils.global".save_session()<CR>' },
  { 'Q', '<CMD>q<CR>' },
  { 'M', '<CMD>lua require"utils.global".toggle_mouse()<CR>' },
  { '<Leader>v', '<CMD>vsp<CR>' },
  { '<Leader>x', '<CMD>sp<CR>' },
  { '<S-l>', '<CMD>bn<CR>' },
  { '<S-h>', '<CMD>bp<CR>' },
  { '<Leader>h', '<CMD>cd %:h<CR>' },
  { "'", '<CMD>lua require"utils.global".quote()<CR>B' },
}

keys.bind_insert_mode {
  { 'jk', '<ESC>' },
}

keys.bind_visual_mode {
  { "'", "c''<Esc>P" },
  { '"', 'c""<Esc>P' },
  { 'yp', 'y`]o<Esc>p' },
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
  { '<', 'v:lua.repl_vsplit("\\<C-\\>\\<C-n\\>\\<C-w\\>h<C-l>", "<")' },
}
