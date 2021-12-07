local keys = require'utils.keybindings'

keys.bind_normal_mode {
  {'<Leader>s', '<CMD>SlimeSendCurrentLine<CR><CMD>FloatermToggle<CR>'},
  {'<Leader>c', '<CMD>SlimeConfig<CR>'},
}

vim.cmd[[
  xmap <Leader>s <Plug>SlimeRegionSend<CMD>FloatermToggle<CR>
]]
