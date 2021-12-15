local keys = require 'utils.keybindings'

-- TODO: pass args as found in the floaterm api (ex: width="--width='0.6'") to minimize parsing
keys.bind_normal_mode {
  {
    '<C-t>',
    '<CMD>lua require"floaterm-config.utils".toggle{name="Terminal", wintype="float", width="0.6"}<CR>',
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
    '<CMD>lua require"floaterm-config.utils".toggle{name="htop", cmd="htop -p `pidof vim`", wintype="split", height="0.5"}<CR>',
  },
  { '<C-n>', '<CMD>lua require"floaterm-config.utils".slime_send_current_line()<CR>' },
}

keys.bind_x_mode {
  { '<C-n>', '<CMD>lua require"floaterm-config.utils".slime_region_send()<CR>' },
}

keys.bind_terminal_mode {
  { '<C-t>', '<CMD>lua require"floaterm-config.utils".toggle{name="Terminal"}<CR>' },
  { '<C-g>', '<CMD>lua require"floaterm-config.utils".toggle{name="LazyGit"}<CR>' },
  { '<C-a>', '<CMD>lua require"floaterm-config.utils".toggle{name="Glow"}<CR>' },
  { '<C-n>', '<CMD>lua require"floaterm-config.utils".toggle{name="REPL"}<CR>' },
  { '<F7>', '<CMD>lua require"floaterm-config.utils".toggle{name="htop"}<CR>' },
  { '<C-f>', '<CMD>lua require"floaterm-config.utils".toggle_winsize()<CR>' },
  { '<C-q>', '<CMD>lua require"floaterm-config.utils".quit()<CR>' },
}
