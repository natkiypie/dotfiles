require 'bufferline-config/keybindings'

require('bufferline').setup {
  options = {
    always_show_bufferline = true,
    indicator_icon = ' ',
    modified_icon = '+',
    left_trunc_marker = '...',
    right_trunc_marker = '...',
    show_buffer_icons = false,
    show_buffer_close_icons = false,
    show_close_icon = false,
    show_tab_indicators = false,
    separator_style = { '∣', '∣' },
    tab_size = 10,
    name_formatter = function(buf)
      if buf.name:match '%.*' then
        return vim.fn.fnamemodify(buf.name, ':t:r')
      end
    end,
  },
}
