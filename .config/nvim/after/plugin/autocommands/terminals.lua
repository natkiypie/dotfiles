local group = vim.api.nvim_create_augroup('Terminals', { clear = true })

vim.api.nvim_create_autocmd('TermEnter', { command = 'lua vim.go.showtabline = 0', group = group })

vim.api.nvim_create_autocmd('TermLeave', { command = 'lua vim.go.showtabline = 2', group = group })
