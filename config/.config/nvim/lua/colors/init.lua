require'colors/options'
require'colors/highlights'

-- Defining syntax/highlights - The syntax API is still a work in progress (https://github.com/nanotee/nvim-lua-guide#defining-syntaxhighlights)

-- Color Scheme
vim.cmd('colorscheme tokyonight')

-- Highlight Groups
vim.cmd[[
  hi Statusline guibg=none
  hi StatusLineNC guibg=none
  hi tablinefill guibg=none
  hi TabLineSel guibg=none guifg=white
]]
