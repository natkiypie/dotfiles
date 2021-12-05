local K = require('utils.init')

K.bind_normal_mode({
  {'<C-b>', "<CMD>Telescope buffers<CR>"},
  {'<C-f>', "<CMD>Telescope find_files<CR>"},
  {'<C-g>', "<CMD>Telescope live_grep<CR>"},
  {'<C-h>', "<CMD>Telescope oldfiles<CR>"},
  {'<C-k>', "<CMD>Telescope keymaps<CR>"},
  {'<C-s>', "<CMD>lua require('session-lens').setup { theme_conf = { borderchars = { { '─', '│', '─', '│', '┌', '┐', '┘', '└'}, prompt = {'─', '│', ' ', '│', '┌', '┐', '│', '│'}, results = {'─', '│', '─', '│', '├', '┤', '┘', '└'}, preview = { '─', '│', '─', '│', '┌', '┐', '┘', '└'}, } }, } ; require('session-lens').search_session()<CR>"},
  {'<C-e>', "<CMD>lua require 'telescope'.extensions.file_browser.file_browser( require('telescope.themes').get_dropdown { layout_config = { height = 0.65, }, prompt_title = 'File Explorer', results_title = '', previewer = false, border = {}, borderchars = { { '─', '│', '─', '│', '┌', '┐', '┘', '└'}, prompt = {'─', '│', ' ', '│', '┌', '┐', '│', '│'}, results = {'─', '│', '─', '│', '├', '┤', '┘', '└'}, preview = { '─', '│', '─', '│', '┌', '┐', '┘', '└'}, }, })<CR>"},
})
