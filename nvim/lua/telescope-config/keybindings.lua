local K = require('util.init')

K.bind_normal_mode({
  {'<LEADER>f', "<CMD>Telescope find_files<CR>"},
  {'<LEADER>g', "<CMD>Telescope live_grep<CR>"},
  {'<LEADER>h', "<CMD>Telescope oldfiles<CR>"}
})
