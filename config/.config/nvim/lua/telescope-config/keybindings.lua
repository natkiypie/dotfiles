local bind_normal_mode = require('utils.keybindings').bind_normal_mode

bind_normal_mode {
  { '<C-f>', '<CMD>Telescope find_files<CR>' },
  { '<F9>', '<CMD>Telescope live_grep<CR>' },
  { '<C-h>', '<CMD>Telescope oldfiles<CR>' },
  { '<C-j>', '<CMD>Telescope jumplist<CR>' },
  { '<C-k>', '<CMD>Telescope keymaps<CR>' },
  {
    '<C-e>',
    '<cmd>lua require "telescope".extensions.file_browser.file_browser()<CR>',
  },
}
