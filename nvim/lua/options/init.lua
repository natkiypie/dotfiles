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
-- set milliseconds to wait for a mapped sequence to complete
vim.go.timeoutlen = 200

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

-- Prevent vim from adding extending comments to new line
-- vim.bo.formatoptions = vim.bo.formatoptions:gsub('cro', '')
-- vim.cmd[[set formatoptions-=cro]]
 vim.api.nvim_command([[set formatoptions-=cro]])

