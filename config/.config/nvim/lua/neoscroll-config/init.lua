require('neoscroll').setup {
  mappings = { '<C-u>', '<C-d>' },
  hide_cursor = false,
}

local t = {}

t['<C-u>'] = { 'scroll', { '-vim.wo.scroll', 'true', '400', [['sine']] } }
t['<C-d>'] = { 'scroll', { 'vim.wo.scroll', 'true', '400', [['sine']] } }

require('neoscroll.config').set_mappings(t)
