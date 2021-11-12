-- VARIABLES:

-- Set map leader key
vim.g.mapleader = ' '

-- OPTIONS

-- Enable lazy redraw
vim.go.lazyredraw = true
-- Disable search highlighting
vim.go.hlsearch = false
-- Enable clickable buffer tabs
vim.go.mouse = 'a'
-- Set milliseconds to wait for a mapped sequence to complete
vim.go.timeoutlen = 200
-- Remove statusline
vim.go.laststatus = 0
-- Set transparency for popup menus
vim.go.pumblend = 30
-- vim.go.winblend = 30

-- Set line numbers
vim.wo.number = true
-- Set relative line numbers
vim.wo.relativenumber = true
-- Highlight cursor row
vim.wo.cursorline = true
-- Highlight cursor column
vim.wo.cursorcolumn = true
-- Text does not move if errors or diagnostics
vim.wo.signcolumn = 'yes'
-- Set tabs to spaces
vim.bo.softtabstop = 2
vim.bo.shiftwidth = 2
vim.bo.expandtab = true
