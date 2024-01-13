local autocmd = vim.api.nvim_create_autocmd

--Leap
autocmd('User', {
  pattern = 'LeapEnter',
  callback = function()
    vim.cmd.hi('Cursor', 'blend=100')
    vim.opt.guicursor:append { 'a:Cursor/lCursor' }
  end,
  desc = 'Workaround for the duplicate cursor bug when autojumping until neovim/neovim#20793 is fixed',
})

autocmd('User', {
  pattern = 'LeapLeave',
  callback = function()
    vim.cmd.hi('Cursor', 'blend=0')
    vim.opt.guicursor:remove { 'a:Cursor/lCursor' }
  end,
  desc = 'Workaround for the duplicate cursor bug when autojumping until neovim/neovim#20793 is fixed',
})

--LSP
autocmd('LspAttach', {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    client.server_capabilities.semanticTokensProvider = nil
  end,
  desc = 'Fix semantic tokens for lsp',
})

--[No Name] buffers,
autocmd('BufHidden', {
  callback = function(event)
    if event.file == '' and vim.bo[event.buf].buftype == '' and not vim.bo[event.buf].modified then
      vim.schedule(function()
        pcall(vim.api.nvim_buf_delete, event.buf, {})
      end)
    end
  end,
})

--Nvchad/ui
autocmd({ 'BufEnter', 'BufWritePost' }, {
  callback = function()
    vim.opt.statusline = '%=%t%m%='
  end,
  desc = 'Disable NvChad statusline',
})

--Nvim-Comment
autocmd('BufEnter', {
  callback = function()
    vim.opt_local.formatoptions = vim.opt_local.formatoptions - { 'c', 'r', 'o' }
  end,
  desc = 'Prevent auto comment new line',
})

--Spellcheck
autocmd({ 'FileType', 'BufWinEnter' }, {
  pattern = { 'gitcommit', 'norg', 'text' },
  command = 'lua vim.opt_local.spell = true',
  desc = 'Disable status column in the following files',
})

--Tabs
autocmd('TabEnter', {
  callback = function()
    vim.go.showtabline = 0
  end,
  desc = 'Disable tabline when tab is opened',
})
