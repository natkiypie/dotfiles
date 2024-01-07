local M = {}

--Git
M.git = {
  function()
    if vim.bo.filetype ~= 'fugitive' then
      return '<cmd> tab Git <CR>'
    else
      return '<cmd> tabc <CR>'
    end
  end,
  'Call any arbitrary Git command',
  opts = { expr = true },
}

M.diff = {
  function()
    if vim.api.nvim_win_get_option(0, 'diff') then
      return '<cmd> tabc <CR>'
    else
      return '<cmd> tab Gvdiffsplit <CR>'
    end
  end,
  'Show changes between commits, commit and working tree, etc',
  opts = { expr = true },
}

M.neorg = {
  function()
    if vim.bo.filetype == 'norg' then
      return '<cmd> Neorg return <CR>'
    else
      return '<cmd> Neorg index <CR>'
    end
  end,
  'Toggle Neorg notes',
  opts = { expr = true },
}

--Splits:
M.sp_right = {
  function()
    local minwin = 1
    local maxwidth = 147
    if #vim.fn.tabpagebuflist() > minwin and vim.fn.winwidth '' < maxwidth then
      return '<C-w>l'
    else
      return '>'
    end
  end,
  'Move to right split',
  opts = { expr = true },
}

--Usercmd:
M.quit = {
  function()
    if require('nvim-tree.view').is_visible() then
      return '<cmd> NvimTreeClose <CR>'
    elseif require('peek').is_open() then
      return '<cmd> PeekClose <CR>'
    else
      return '<cmd> lua require"custom.usercmd".close() <CR>'
    end
  end,
  'Close NvimTree, Peek preview, buffer, or quit',
  opts = { expr = true },
}

M.sp_left = {
  function()
    local minwin = 1
    local maxwidth = 147
    if #vim.fn.tabpagebuflist() > minwin and vim.fn.winwidth '' < maxwidth then
      return '<C-w>h'
    else
      return '<'
    end
  end,
  'Move to right split',
  opts = { expr = true },
}

M.sp_up = {
  function()
    local minwin = 1
    local maxheight = 35
    if #vim.fn.tabpagebuflist() > minwin and vim.fn.winheight '' < maxheight then
      return '<C-w>k'
    else
      return 'K'
    end
  end,
  'Move up horizontal split',
  opts = { expr = true },
}

M.sp_down = {
  function()
    local minwin = 1
    local maxheight = 35
    if #vim.fn.tabpagebuflist() > minwin and vim.fn.winheight '' < maxheight then
      return '<C-w>j'
    else
      return 'J'
    end
  end,
  'Move down horizontal split',
  opts = { expr = true },
}

M.sp_increase = {
  function()
    local minwin = 1
    local maxheight = 35
    if #vim.fn.tabpagebuflist() > minwin and vim.fn.winheight '' < maxheight then
      return '<cmd> resize +5 <CR>'
    else
      return '+'
    end
  end,
  'Increase height of horizontal split',
  opts = { expr = true },
}

M.sp_decrease = {
  function()
    local minwin = 1
    local maxheight = 35
    if #vim.fn.tabpagebuflist() > minwin and vim.fn.winheight '' < maxheight then
      return '<cmd> resize -5 <CR>'
    else
      return '_'
    end
  end,
  'Decrease height of horizontal split',
  opts = { expr = true },
}

M.sp_vincrease = {
  function()
    local minwin = 1
    local maxwidth = 147
    if #vim.fn.tabpagebuflist() > minwin and vim.fn.winwidth '' < maxwidth then
      return '<cmd> vertical resize +5 <CR>'
    else
      return '='
    end
  end,
  'Increase width of vertical split',
  opts = { expr = true },
}

M.sp_vdecrease = {
  function()
    local minwin = 1
    local maxwidth = 147
    if #vim.fn.tabpagebuflist() > minwin and vim.fn.winwidth '' < maxwidth then
      return '<cmd> vertical resize -5 <CR>'
    else
      return '-'
    end
  end,
  'Decrease  width of vertical split',
  opts = { expr = true },
}

--Wildmenu:
M.wm_up = {
  function()
    if vim.fn.wildmenumode() == 1 then
      return '<left>'
    else
      return '<C-k>'
    end
  end,
  'Move up in wildmenu',
  opts = { expr = true },
}

M.wm_down = {
  function()
    if vim.fn.wildmenumode() == 1 then
      return '<right>'
    else
      return '<C-j>'
    end
  end,
  'Move down in wildmenu',
  opts = { expr = true },
}

M.wm_select = {
  function()
    if vim.fn.wildmenumode() == 1 then
      return '<CR>'
    else
      return '<C-l>'
    end
  end,
  'Make selection in wildmenu',
  opts = { expr = true },
}

M.wm_close = {
  function()
    if vim.fn.wildmenumode() == 1 then
      return '<up>'
    else
      return '<C-h>'
    end
  end,
  'Close wildmenu',
  opts = { expr = true },
}

return M
