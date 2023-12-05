return {
  'jpalardy/vim-slime',
  config = function()
    vim.cmd [[
      let g:slime_target = 'neovim'
      let g:slime_no_mappings = 1
      let g:slime_dont_ask_default = 1
    ]]
  end,
}
