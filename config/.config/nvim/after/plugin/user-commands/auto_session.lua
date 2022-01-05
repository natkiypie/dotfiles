vim.api.nvim_add_user_command('SuppressCWD', function()
  require('auto-session-config.utils').suppress_dir()
end, { nargs = 0 })

vim.api.nvim_add_user_command('SanctionCWD', function()
  require('auto-session-config.utils').sanction_dir()
end, { nargs = 0 })
