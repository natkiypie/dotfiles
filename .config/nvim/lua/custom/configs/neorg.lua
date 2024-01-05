local neorg = require 'neorg'

neorg.setup {
  load = {
    ['core.defaults'] = {},
    ['core.concealer'] = {},
    ['core.dirman'] = {
      config = {
        workspaces = {
          notes = '~/.neorg',
        },
        default_workspace = 'notes',
      },
    },
  },
}
