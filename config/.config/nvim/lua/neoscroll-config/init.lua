require('neoscroll').setup {
  mappings = { '<C-u>', '<C-d>' },
  hide_cursor = false,
}

local t = {}

t['<C-u>'] = { 'scroll', { '-vim.wo.scroll', 'true', '200', [['sine']] } }
t['<C-d>'] = { 'scroll', { 'vim.wo.scroll', 'true', '200', [['sine']] } }

require('neoscroll.config').set_mappings(t)
