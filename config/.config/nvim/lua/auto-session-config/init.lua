require 'auto-session-config/options'

local opts = {
  log_level = 'info',
  auto_session_enable_last_session = false,
  auto_session_root_dir = '/home/natkiypie/.dotfiles/config/.config/nvim/sessions/',
  auto_session_enabled = true,
  auto_save_enabled = nil,
  auto_restore_enabled = nil,
  auto_session_suppress_dirs = {
    '~/',
    '~/.dotfiles/bash',
    -- '~/.dotfiles/config/.config/nvim',
  },
}

require('auto-session').setup(opts)
