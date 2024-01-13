local M = {}

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

local function set_contains(t, e)
  for i = 1, #t do
    if t[i] == e then
      return true
    end
  end
  return false
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

function M.clear_cmdline()
  if vim.opt.cmdheight._value ~= 0 then
    vim.cmd 'normal! :'
  end
end

function M.close()
  if #vim.fn.tabpagebuflist() > 1 then
    close_split()
  else
    close_float_win()
  end
end

function M.mkdir(dir)
  if vim.fn.isdirectory(dir) == 0 then
    vim.fn.mkdir(dir)
  end
end

function M.mkfile(file)
  if vim.fn.filereadable(file) == 1 then
    vim.cmd('edit' .. file)
  else
    vim.fn.mkdir(vim.fn.fnamemodify(file, ':p:h'), 'p')
    vim.cmd('edit' .. file)
    vim.cmd 'startinsert'
  end
end

function M.is_filetype(file, filetypes)
  local ext = vim.fn.fnamemodify(file, ':e')
  return set_contains(filetypes, ext)
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

M.toggle_fullscreen = {
  function()
    if vim.fn.tabpagenr() <= 1 then
      vim.cmd 'tab split'
    else
      vim.cmd 'tabc'
    end
  end,
  'Fill window with buffer',
}

M.toggle_term = {
  function()
    require('nvterm.terminal').toggle 'horizontal'
  end,
  'Toggle horizontal term',
}

M.write = {
  function()
    vim.cmd 'write'
  end,
  'Write buffer to file',
}

return M
