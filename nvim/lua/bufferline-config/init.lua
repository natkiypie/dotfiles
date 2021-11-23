require('bufferline-config/keybindings')
require("bufferline").setup({
  options = {
    enforce_regular_tabs = true,
    separator_style = {'', ''},
    close_icon = '',
    diagnostics = "nvim_lsp",
  },
  highlights = {
    indicator_selected = {
      guifg = '#fff',
    }
  },
})

