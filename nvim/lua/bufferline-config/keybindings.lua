local K = require('utils.init')

K.bind_normal_mode({
  {'<S-l>', '<CMD>BufferLineCycleNext<CR>'},
  {'<S-h>', '<CMD>BufferLineCyclePrev<CR>'},
  {'<S-j>', '<CMD>BufferLineMoveNext<CR>'},
  {'<S-k>', '<CMD>BufferLineMovePrev<CR>'}
})
