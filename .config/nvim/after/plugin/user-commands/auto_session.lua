vim.api.nvim_create_user_command('SuppressDir', function()
  local cwd = require('utils.auto-session').get_cwd()
  local suppress_dirs = vim.fn.expand '~/.auto_session_suppress_dirs.txt'
  require('utils.auto-session').check_suppress_dirs('suppress', cwd, suppress_dirs)
end, { nargs = 0 })

vim.api.nvim_create_user_command('SanctionDir', function()
  local cwd = require('utils.auto-session').get_cwd()
  local suppress_dirs = vim.fn.expand '~/.auto_session_suppress_dirs.txt'
  require('utils.auto-session').check_suppress_dirs('sanction', cwd, suppress_dirs)
end, { nargs = 0 })
