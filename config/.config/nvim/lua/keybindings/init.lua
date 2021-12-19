require('utils.keybindings').bind_normal_mode {
  { 'j', 'gj' },
  { 'k', 'gk' },
  { '<C-w>', '<CMD>w<CR>' },
  { 'q', '<CMD>lua require"keybindings.utils".close_float_win()<CR>' },
  { '<C-q>', '<CMD>lua require"keybindings.utils".save_session()<CR>' },
  { 'Q', '<CMD>q<CR>' },
  { 'M', '<CMD>lua require"keybindings.utils".toggle_mouse()<CR>' },
  { '<Leader>v', '<CMD>vsp<CR>' },
  { '<Leader>x', '<CMD>sp<CR>' },
  { '<S-l>', '<CMD>bn<CR>' },
  { '<S-h>', '<CMD>bp<CR>' },
  { '<Leader>h', '<CMD>cd %:h<CR>' },
  { "'", '<CMD>lua require"keybindings.utils".quote()<CR>B' },
  { '<CR>', '<CMD>lua require"keybindings.utils".toggle_tab()<CR>' },
}

require('utils.keybindings').bind_insert_mode {
  { 'jk', '<ESC>' },
}

require('utils.keybindings').bind_visual_mode {
  { "'", "c''<Esc>P" },
  { '"', 'c""<Esc>P' },
  { 'yp', 'y`]o<Esc>p' },
}

require('utils.keybindings').bind_command_mode {
  { 'jk', '<ESC><C-l>' },
}

require('utils.keybindings').bind_terminal_mode {
  { '<ESC>', '<C-\\><C-n>' },
}

require('utils.keybindings').bind_expr_normal_mode {
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

require('utils.keybindings').bind_expr_command_mode {
  { '<C-k>', 'v:lua.wildmenu("\\<Left\\>")' },
  { '<C-j>', 'v:lua.wildmenu("\\<Right\\>")' },
  { '<C-h>', 'v:lua.wildmenu("\\<Up\\>")' },
  { '<C-l>', 'v:lua.wildmenu("\\<CR\\>")' },
}
require('utils.keybindings').bind_expr_terminal_mode {
  { '<', 'v:lua.repl_vsplit("\\<C-\\>\\<C-n\\>\\<C-w\\>h<C-l>", "<")' },
}
