require('utils.keybindings').bind_normal_mode {
  -- {
  --   '<C-t>',
  --   '<CMD>lua require"floaterm-config.utils".toggle{name="Terminal", wintype="float", width="0.6"}<CR>',
  -- },
  {
    '<C-t>',
    '<CMD>lua require"floaterm-config.utils".toggle{name="Terminal", wintype="split", height="0.5"}<CR>',
  },
  {
    '<C-g>',
    '<CMD>lua require"floaterm-config.utils".toggle{name="LazyGit", cmd="lazygit", wintype="float", width="0.6"}<CR>',
  },
  {
    '<C-a>',
    '<CMD>lua require"floaterm-config.utils".toggle{name="Glow", cmd="glow_script.sh", wintype="float", width="0.6"}<CR>',
  },
  {
    '<F7>',
    '<CMD>lua require"floaterm-config.utils".toggle{name="Htop", cmd="htop -p `pidof vim`", wintype="split", height="0.5"}<CR>',
  },
  {
    '<C-s>',
    '<CMD>lua require"floaterm-config.utils".slime("n")<CR>',
  },
  -- {
  --   '<C-e>',
  --   '<CMD>lua require"floaterm-config.utils".toggle{name="Broot", cmd="broot", wintype="float", width="0.6"}<CR>',
  -- },
  {
    '<C-e>',
    '<CMD>silent BrootWorkingDirectory<CR>',
  },
}

require('utils.keybindings').bind_x_mode {
  { '<C-s>', '<CMD>lua require"floaterm-config.utils".slime("x")<CR>' },
}

require('utils.keybindings').bind_terminal_mode {
  { '<C-t>', '<CMD>lua require"floaterm-config.utils".toggle{name="Terminal"}<CR>' },
  { '<C-g>', '<CMD>lua require"floaterm-config.utils".toggle{name="LazyGit"}<CR>' },
  { '<C-a>', '<CMD>lua require"floaterm-config.utils".toggle{name="Glow"}<CR>' },
  { '<C-s>', '<CMD>lua require"floaterm-config.utils".toggle{name="REPL"}<CR>' },
  { '<F7>', '<CMD>lua require"floaterm-config.utils".toggle{name="Htop"}<CR>' },
  { '<C-e>', '<CMD>lua require"floaterm-config.utils".toggle{name="Broot"}<CR>' },
  -- { '<C-f>', '<CMD>lua require"floaterm-config.utils".toggle_winsize()<CR>' },
  { '<C-f>', '<C-\\><C-n><CMD>lua require"keybindings.utils".toggle_tab()<CR>i' },
  { '<C-q>', '<CMD>lua require"floaterm-config.utils".quit()<CR>' },
}
require('utils.keybindings').bind_expr_terminal_mode {
  -- { 'q', 'v:lua.no_q("\\<CMD\\>lua require\'floaterm-config.utils\'.quit()\\<CR\\>", "q")' },
  { 'q', 'v:lua.no_q("\\<Esc\\>", "q")' },
  { '<', 'v:lua.repl("\\<C-\\>\\<C-n\\>\\<C-w\\>h<C-l>", "<")' },
}

require('utils.keybindings').bind_expr_normal_mode {
  {
    '<BS>',
    'v:lua.repl("\\<CMD\\>FloatermSend --name=REPL console.log(\'\\\\u001B\\[2J\\\\u001B\\[0;0f\');\\<CR\\>", "<BS>")',
  },
}
