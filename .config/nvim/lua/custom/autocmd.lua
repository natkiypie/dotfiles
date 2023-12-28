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

--Nvim-Comment
autocmd('BufEnter', {
  callback = function()
    vim.opt_local.formatoptions = vim.opt_local.formatoptions - { 'c', 'r', 'o' }
  end,
  desc = 'Prevent auto comment new line',
})
