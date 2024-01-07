local neorg = require 'neorg'

neorg.setup {
  load = {
    ['core.defaults'] = {},
    -- ['core.completion'] = {}, -- Wait until wiki links are working to see documentation
    ['core.concealer'] = {},
    ['core.dirman'] = {
      config = {
        workspaces = {
          notes = '$HOME/.neorg',
        },
        default_workspace = 'notes',
      },
    },
    ['core.keybinds'] = {
      config = {
        hook = function(keybinds)
          keybinds.remap_key('norg', 'i', '<M-CR>', '<C-]>')
        end,
      },
    },
  },
}
