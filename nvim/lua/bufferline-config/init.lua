require('bufferline-config/keybindings')
require("bufferline").setup({
  options = {
    enforce_regular_tabs = true,
    separator_style = {'', ''}
  },
  highlights = {
    indicator_selected = {
      guifg = '#fff',
    }
  }
})

