require('utils.keybindings').bind_normal_mode {
  { 'j', 'gj' },
  { 'k', 'gk' },
  { '<C-w>', '<CMD>w<CR>' },
  { 'q', '<CMD>lua require"utils.general".close_float_win()<CR>' },
  { '<C-q>', '<CMD>lua require"auto-session-config.utils".save_session()<CR>' },
  { 'Q', '<CMD>q<CR>' },
  { 'M', '<CMD>lua require"utils.general".toggle_mouse()<CR>' },
  { '<Leader>v', '<CMD>lua require"utils.general".vsplit_back("v")<CR>' },
  { '<Leader>x', '<CMD>lua require"utils.general".vsplit_back("x")<CR>' },
  { '<S-l>', '<CMD>bn<CR>' },
  { '<S-h>', '<CMD>bp<CR>' },
  { '<Leader>h', '<CMD>cd %:h<CR>' },
  { '<CR>', '<CMD>lua require"utils.general".toggle_tab()<CR>' },
  { '<C-h>', '<CMD>browse oldfiles<CR>' },
  { '<C-t>', '<CMD>lua require"scripts.terminals.terminal".issue("/bin/bash")<CR>' },
  { '<C-g>', '<CMD>lua require"scripts.terminals.terminal".issue("lazygit")<CR>' },
  { '<C-a>', '<CMD>lua require"scripts.terminals.terminal".issue("glow_script.sh")<CR>' },
  { '<C-e>', '<CMD>lua require"scripts.terminals.broot".open()<CR>' },
  { '<C-s>', '<CMD>lua require"scripts.terminals.slime".test()<CR>' },
}

require('utils.keybindings').bind_insert_mode {
  { 'jk', '<ESC>' },
  { '<C-a>', '<ESC>la' },
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
  { '<Del>', '<C-\\><C-n>' },
}

require('utils.keybindings').bind_expr_normal_mode {
  { '>', 'v:lua.vsplit("\\<C-w\\>l", ">")' },
  { '<', 'v:lua.vsplit("\\<C-w\\>h", "<")' },
  { 'K', 'v:lua.split("\\<C-w\\>k", "K")' },
  { 'J', 'v:lua.split("\\<C-w\\>j", "J")' },
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
  {
    '<C-t>',
    'v:lua.issue_t_mode("/bin/bash", "\\<CMD\\>lua require\'scripts.terminals.terminal\'.issue(\'/bin/bash\')\\<CR\\>", "\\<C-t\\>")',
  },
  {
    '<C-g>',
    'v:lua.issue_t_mode("lazygit", "\\<CMD\\>lua require\'scripts.terminals.terminal\'.issue(\'lazygit\')\\<CR\\>", "\\<C-g\\>")',
  },
  {
    '<C-a>',
    'v:lua.issue_t_mode("glow", "\\<CMD\\>lua require\'scripts.terminals.terminal\'.issue(\'glow_script.sh\')\\<CR\\>", "\\<C-a\\>")',
  },
  {
    '<C-s>',
    'v:lua.issue_t_mode("node", "\\<CMD\\>lua require\'scripts.terminals.slime\'.test()\\<CR\\>", "\\<C-s\\>")',
  },
}
