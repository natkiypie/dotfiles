-- VARIABLES:
-- Global
-- set map leader key
vim.g.mapleader = ' '

-- OPTIONS

-- Global
-- enable lazy redraw
vim.go.lazyredraw = true
-- disable search highlighting
vim.go.hlsearch = false
-- enable clickable buffer tabs
vim.go.mouse = 'a'

-- Window
-- set line numbers
vim.wo.number = true
-- set relative line numbers
vim.wo.relativenumber = true
-- highlight cursor row
vim.wo.cursorline = true
-- highlight cursor column
vim.wo.cursorcolumn = true

-- Buffer
-- set tabs to spaces
vim.bo.expandtab = true
vim.bo.shiftwidth = 2
vim.bo.softtabstop = 2
