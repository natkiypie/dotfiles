require 'colors/options'

-- Color Scheme
vim.cmd 'colorscheme tokyonight'

-- Highlight Groups
-- Defining syntax/highlights - The syntax API is still a work in progress (https://github.com/nanotee/nvim-lua-guide#defining-syntaxhighlights)
vim.cmd [[
  hi Statusline guibg=none
  hi StatusLineNC guibg=none guifg=black
  hi tablinefill guibg=none
  hi TabLineSel guibg=none guifg=white
]]
