vim.api.nvim_add_user_command('SuppressCWD', function()
  require('auto-session-config.utils').suppress_dir()
end, { nargs = 0 })
