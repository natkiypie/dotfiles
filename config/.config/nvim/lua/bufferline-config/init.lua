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
    tab_size = 18,
    max_name_length = 80,
    name_formatter = function(buf)
      return vim.fn.fnamemodify(buf.path, ':p:h:t') .. '/' .. buf.name
    end,
    custom_filter = function(buf)
      return not vim.fn.bufname(buf):match 'bash'
    end,
  },
}
