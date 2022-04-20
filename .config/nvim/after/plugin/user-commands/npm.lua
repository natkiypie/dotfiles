vim.api.nvim_create_user_command('Npm', function(opts)
  require('scripts.npm').start(opts.args)
end, { nargs = 1 })
