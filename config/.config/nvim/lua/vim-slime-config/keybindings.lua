local keys = require'utils.keybindings'

keys.bind_normal_mode {
  {'<Leader>e', '<CMD>SlimeSendCurrentLine<CR><CMD>silent FloatermShow REPL<CR>'},
  {'<Leader>c', '<CMD>SlimeConfig<CR>'},
}

vim.cmd[[
  xmap <Leader>e <Plug>SlimeRegionSend<CMD>silent FloatermShow REPL<CR>
]]
