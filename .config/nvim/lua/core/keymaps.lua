require('utils.keymaps').bind_normal_mode {
  { 'j', 'gj' },
  { 'k', 'gk' },
  { 'x', '"_x' },
  { '<C-w>', '<CMD>w<CR>' },
  { '<C-q>', '<CMD>lua require"utils.general".close_all()<CR>' },
  { 'M', '<CMD>lua require"utils.general".toggle_mouse()<CR>' },
  { '<S-l>', '<CMD>bn<CR>' },
  { '<S-h>', '<CMD>bp<CR>' },
  { '<Leader>h', '<CMD>cd %:h<CR>' },
  { '<CR>', '<CMD>lua require"utils.general".toggle_tab()<CR>' },
  { '<C-t>', '<CMD>lua require"scripts.terminals.bash".issue("/bin/bash")<CR>' },
  { '<C-f>', '<CMD>lua require"scripts.terminals.bash".issue("glow.sh")<CR>' },
  { '<C-g>', '<CMD>lua require"scripts.terminals.bash".issue("lazygitsh")<CR>' },
  { '<C-e>', '<CMD>lua require"scripts.terminals.broot".open()<CR>' },
  { 'm', '<CMD>lua require"utils.bufferline".bufferline_pick()<CR>' },
  { '<C-_>', '<CMD>CommentToggle<CR>' },
  { '<C-p>', 'vip:CommentToggle<CR>' },
  { 'clp', 'yy:CommentToggle<CR>p' },
  { '<C-c><C-p>', '}o<ESC>2kyipvip:CommentToggle<CR>}p' },
}

require('utils.keymaps').bind_insert_mode {
  { 'jk', '<ESC>l' },
  { '<C-c>', '<ESC>l' },
  { '<C-a>', '<ESC>la' },
}

require('utils.keymaps').bind_visual_mode {
  { "'", "c''<Esc>P" },
  { '"', 'c""<Esc>P' },
  { 'yp', 'y`]o<Esc>p' },
  { '<C-_>', ':CommentToggle<CR>' },
  { '<C-c><C-p>', 'yv`]:CommentToggle<CR>`]p' },
  { '<C-c><C-y>', 'yv`]:CommentToggle<CR>' },
}

require('utils.keymaps').bind_command_mode {
  { 'jk', '<ESC><C-l>' },
}

require('utils.keymaps').bind_terminal_mode {
  { '<Del>', '<C-\\><C-n>' },
}

require('utils.keymaps').bind_expr_normal_mode {
  { '>', 'v:lua.vsplit("\\<C-w\\>l", ">")' },
  { '<', 'v:lua.vsplit("\\<C-w\\>h", "<")' },
  { '-', 'v:lua.vsplit("\\<CMD\\>vertical resize -5\\<CR\\>", "-")' },
  { '=', 'v:lua.vsplit("\\<CMD\\>vertical resize +5\\<CR\\>", "=")' },
  { 'K', 'v:lua.split("\\<C-w\\>k", "K")' },
  { 'J', 'v:lua.split("\\<C-w\\>j", "J")' },
  { '_', 'v:lua.split("\\<CMD\\>resize -5\\<CR\\>", "_")' },
  { '+', 'v:lua.split("\\<CMD\\>resize +5\\<CR\\>", "+")' },
  {
    '<Leader>v',
    'v:lua.split_nav("\\<CMD\\>lua require\'utils.general\'.vsplit_back(\'v\')\\<CR\\>", "<Leader>v")',
  },
  {
    '<Leader>x',
    'v:lua.split_nav("\\<CMD\\>lua require\'utils.general\'.vsplit_back(\'x\')\\<CR\\>", "<Leader>x")',
  },
  {
    '<C-h>',
    'v:lua.repl_cmd("\\<CMD\\>lua require\'scripts.terminals.slime\'.help()\\<CR\\>", "<CMD>browse oldfiles<CR>")',
  },
  {
    '<C-l>',
    'v:lua.repl_cmd("\\<CMD\\>lua require\'scripts.terminals.slime\'.clear()\\<CR\\>", "<C-l>")',
  },
  {
    'q',
    'v:lua.repl_cmd("\\<CMD\\>lua require\'scripts.terminals.slime\'.exit()\\<CR\\>", "<CMD>lua require\'utils.general\'.close()<CR>")',
  },
  {
    '<C-s>',
    'v:lua.split_no_slime("\\<CMD\\>lua require\'scripts.terminals.slime\'.send(\'n\')\\<CR\\>", "<C-s>")',
  },
}

require('utils.keymaps').bind_expr_x_mode {
  {
    '<C-s>',
    'v:lua.split_no_slime("\\<CMD\\>lua require\'scripts.terminals.slime\'.send(\'x\')\\<CR\\>", "<C-s>")',
  },
}

require('utils.keymaps').bind_expr_command_mode {
  { '<C-k>', 'v:lua.wildmenu("\\<Left\\>")' },
  { '<C-j>', 'v:lua.wildmenu("\\<Right\\>")' },
  { '<C-h>', 'v:lua.wildmenu("\\<Up\\>")' },
  { '<C-l>', 'v:lua.wildmenu("\\<CR\\>")' },
}

require('utils.keymaps').bind_expr_terminal_mode {
  {
    '<C-t>',
    'v:lua.toggle_term("/bin/bash", "\\<CMD\\>lua require\'scripts.terminals.bash\'.issue(\'/bin/bash\')\\<CR\\>", "\\<C-t\\>")',
  },
  {
    '<C-f>',
    'v:lua.toggle_term("glow.sh", "\\<CMD\\>lua require\'scripts.terminals.bash\'.issue(\'glow.sh\')\\<CR\\>", "\\<C-f\\>")',
  },
  {
    '<C-g>',
    'v:lua.toggle_term("lazygitsh", "\\<CMD\\>lua require\'scripts.terminals.bash\'.issue(\'lazygit\')\\<CR\\>", "\\<C-g\\>")',
  },
}
