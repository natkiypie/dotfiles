local K = require('util.init')

K.bind_normal_mode({
  {'<TAB>', '<CMD>BufferLineCycleNext<CR>'},
  {'<S-TAB>', '<CMD>BufferLineCyclePrev<CR>'},
  {'<LEADER><TAB>', '<CMD>BufferLineMoveNext<CR>'},
  {'<LEADER><S-TAB>', '<CMD>BufferLineMovePrev<CR>'}
})
