require('bufferline-config/keybindings')
require("bufferline").setup({
  options = {
    enforce_regular_tabs = true,
    separator_style = {'', ''},
    close_icon = ''
  },
  highlights = {
    indicator_selected = {
      guifg = '#fff',
    }
  }
})

