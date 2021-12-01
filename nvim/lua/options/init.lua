-- VARIABLES:

-- Set map leader key
vim.g.mapleader = ' '

-- OPTIONS
-- Enable lazy redraw
vim.go.lazyredraw = true

-- Disable search highlighting
vim.go.hlsearch = false

-- Set milliseconds to wait for a mapped sequence to complete
vim.go.timeoutlen = 200

-- Statusline
vim.cmd[[
  set laststatus=2
  set statusline=
  set statusline+=%f
  set statusline+=%h%m%r%w
  set statusline+=%=
  set statusline+=%-6n
  set statusline+=\%-7{strlen(&ft)?&ft:'none'}
  set statusline+=%-8(%l,%c%V%)
]]

-- Set transparency for popup menus (for nvim-cmp autocomplete menu)
vim.go.pumblend = 30

-- Set line numbers
vim.wo.number = true

-- Set relative line numbers
vim.wo.relativenumber = true

-- Text does not move if errors or diagnostics
vim.wo.signcolumn = 'yes'

-- Set tabs to spaces
vim.bo.softtabstop = 2
vim.bo.shiftwidth = 2
vim.bo.expandtab = true
