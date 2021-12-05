local K = require('utils.init')

K.bind_normal_mode({
  {'<C-b>', "<CMD>Telescope buffers<CR>"},
  {'<C-e>', "<CMD>Telescope file_browser<CR>"},
  {'<C-f>', "<CMD>Telescope find_files<CR>"},
  {'<C-g>', "<CMD>Telescope live_grep<CR>"},
  {'<C-h>', "<CMD>Telescope oldfiles<CR>"},
  {'<C-k>', "<CMD>Telescope keymaps<CR>"},
  {'<C-s>', "<CMD>lua require('session-lens').setup { theme_conf = { borderchars = { { '─', '│', '─', '│', '┌', '┐', '┘', '└'}, prompt = {'─', '│', ' ', '│', '┌', '┐', '│', '│'}, results = {'─', '│', '─', '│', '├', '┤', '┘', '└'}, preview = { '─', '│', '─', '│', '┌', '┐', '┘', '└'}, } }, } ; require('session-lens').search_session()<CR>"},
})
