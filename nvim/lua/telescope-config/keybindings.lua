local K = require('utils.init')

K.bind_normal_mode({
  {'<LEADER>f', "<CMD>Telescope find_files<CR>"},
  {'<LEADER>g', "<CMD>Telescope live_grep<CR>"},
  {'<LEADER>h', "<CMD>Telescope oldfiles<CR>"},
  {'<C-e>', "<CMD>Telescope file_browser<CR>"},
})
