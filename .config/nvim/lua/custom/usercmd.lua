local M = {}

local tabline = 2

local function exec_arg(a, b)
  vim.cmd(string.gsub(string.gsub('a b', 'b', b), 'a', a))
end

local function close_win_on_last_buf()
  local buffers = vim.fn.len(vim.fn.filter(vim.fn.range(1, vim.fn.bufnr '$'), 'buflisted(v:val)'))
  if buffers == 1 then
    vim.cmd 'q'
  else
    vim.cmd 'bd'
  end
end

local function close_float_win()
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    if vim.api.nvim_win_get_config(win).relative ~= '' then
      vim.api.nvim_win_close(win, false)
    end
  end
  close_win_on_last_buf()
end

local function close_split()
  if vim.fn.winnr() > 1 then
    vim.cmd 'q'
  else
    vim.cmd [[
      wincmd l
      q
    ]]
  end
end

local function vsplit_back(split)
  if split == 'x' then
    vim.cmd 'split'
  else
    vim.cmd 'vsplit'
  end
  if vim.fn.buflisted(vim.fn.bufname '#') == 1 then
    vim.cmd 'b#'
  end
end

function M.close()
  if #vim.fn.tabpagebuflist() > 1 then
    close_split()
  else
    close_float_win()
  end
end

M.close_all = {
  function()
    vim.cmd 'silent wa|qa'
  end,
  'Close all buffers and window',
}

M.buf_right = {
  function()
    require('nvchad.tabufline').move_buf(1)
  end,
  'Move buffer right',
}

M.buf_left = {
  function()
    require('nvchad.tabufline').move_buf(-1)
  end,
  'Move buffer left',
}

M.mouse = {
  function()
    if vim.go.mouse == '' then
      vim.go.mouse = 'a'
    else
      vim.go.mouse = ''
    end
  end,
  'Toggle mouse',
}

M.sp_h = {
  function()
    vsplit_back 'x'
  end,
  'Create a horizontal split',
}

M.sp_v = {
  function()
    vsplit_back 'v'
  end,
  'Create a vertical split',
}

M.spell = {
  function()
    if vim.wo.spell == true then
      vim.wo.spell = false
    else
      vim.wo.spell = true
    end
  end,
  'Toggle spell check',
}

M.toggle_tab = {
  function()
    if vim.fn.tabpagenr() <= 1 then
      vim.cmd 'tab split'
      tabline = 0
      vim.go.showtabline = tabline
    else
      local originbufferid = vim.fn.bufnr ''
      vim.cmd 'tabc'
      tabline = 2
      vim.go.showtabline = tabline
      exec_arg('buffer', originbufferid)
    end
  end,
  'Fill window with buffer',
}

M.write = {
  function()
    vim.cmd 'write'
  end,
  'Write buffer to file',
}

return M
