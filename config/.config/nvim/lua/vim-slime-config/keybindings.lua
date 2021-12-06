local K = require('utils.init')

K.bind_normal_mode({
  {'<Leader>s', '<CMD>SlimeSendCurrentLine<CR><CMD>FloatermToggle<CR>'},
  {'<Leader>c', '<CMD>SlimeConfig<CR>'},
})

K.bind_visual_mode({
  {'<Leader>s','<CMD>SlimeSend<CR><CMD>FloatermToggle<CR>'},
})

