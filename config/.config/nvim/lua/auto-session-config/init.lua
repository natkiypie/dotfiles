require 'auto-session-config/options'

local M = {}

local opts = {
  log_level = 'info',
  auto_session_enable_last_session = false,
  auto_session_root_dir = '/home/natkiypie/.dotfiles/config/.config/nvim/sessions/',
  auto_session_enabled = true,
  auto_save_enabled = false,
  auto_restore_enabled = true,
  auto_session_suppress_dirs = require('auto-session-config/utils').get_suppressed_dirs(),
}

require('auto-session').setup(opts)

return M
