require 'auto-session-config/options'

local opts = {
  log_level = 'info',
  auto_session_enable_last_session = false,
  auto_session_root_dir = '/home/natkiypie/.dotfiles/config/.config/nvim/sessions/',
  auto_session_enabled = true,
  auto_save_enabled = false,
  auto_restore_enabled = true,
  auto_session_suppress_dirs = {
    '~/',
    '~/.dotfiles/bash',
  },
}

require('auto-session').setup(opts)
