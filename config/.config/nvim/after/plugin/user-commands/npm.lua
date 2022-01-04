vim.api.nvim_add_user_command('Npm', function(opts)
  require('scripts.npm').start(opts.args)
end, { nargs = 1 })
