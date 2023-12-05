return {
  'rmagatti/auto-session',
  config = function()
    local auto_session = require 'auto-session'

    auto_session.setup {
      log_level = 'error',
      auto_session_enable_last_session = false,
      auto_session_root_dir = vim.fn.expand '$NVIM_CONFIG/sessions/',
      auto_session_enabled = true,
      auto_save_enabled = false,
      auto_restore_enabled = true,
      auto_session_suppress_dirs = require('utils/auto-session').get_suppress_dirs(),
    }
  end,
}
