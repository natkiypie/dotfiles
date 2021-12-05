vim.g.tokyonight_style = 'night'
vim.g.tokyonight_transparent = true

-- Color Scheme
vim.cmd('colorscheme tokyonight')

-- Highlight Groups
vim.cmd[[
  hi Statusline guibg=none
  hi StatusLineNC guibg=none
  hi tablinefill guibg=none
  hi TabLineSel guibg=none guifg=white
]]
