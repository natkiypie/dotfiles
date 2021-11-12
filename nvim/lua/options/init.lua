-- VARIABLES:
-- Global
-- set map leader key
vim.g.mapleader = ' '
vim.cmd[[highlight Pmenu guibg=none]]

-- OPTIONS
-- Global
-- enable lazy redraw
vim.go.lazyredraw = true
-- disable search highlighting
vim.go.hlsearch = false
-- enable clickable buffer tabs
vim.go.mouse = 'a'
-- set milliseconds to wait for a mapped sequence to complete
vim.go.timeoutlen = 200
-- remove statusline
vim.go.laststatus = 0
-- set transparency for popup menus
vim.go.pumblend = 30
-- vim.go.winblend = 30

-- Window
-- set line numbers
vim.wo.number = true
-- set relative line numbers
vim.wo.relativenumber = true
-- highlight cursor row
vim.wo.cursorline = true
-- highlight cursor column
vim.wo.cursorcolumn = true
-- text does not move if errors or diagnostics
vim.wo.signcolumn = 'yes'

-- Buffer
-- set tabs to spaces
vim.bo.expandtab = true
vim.bo.shiftwidth = 2
vim.bo.softtabstop = 2
