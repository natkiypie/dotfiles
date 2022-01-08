vim.api.nvim_add_user_command('SuppressDir', function()
  local cwd = require('auto-session-config.utils').get_cwd()
  local suppress_dirs = vim.fn.expand '~/.auto_session_suppress_dirs.txt'
  require('auto-session-config.utils').check_suppress_dirs('suppress', cwd, suppress_dirs)
end, { nargs = 0 })

vim.api.nvim_add_user_command('SanctionDir', function()
  local cwd = require('auto-session-config.utils').get_cwd()
  local suppress_dirs = vim.fn.expand '~/.auto_session_suppress_dirs.txt'
  require('auto-session-config.utils').check_suppress_dirs('sanction', cwd, suppress_dirs)
end, { nargs = 0 })
