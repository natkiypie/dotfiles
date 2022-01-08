local M = {}

local function pass_save_criteria()
  local function writable()
    local cwd = require('auto-session-config.utils').get_cwd()
    for _, v in ipairs(require('auto-session-config/utils').get_suppress_dirs()) do
      if v == cwd then
        return true
      end
    end
  end
  return not writable() and vim.api.nvim_eval '&readonly' == 0 and vim.fn.bufname '' ~= ''
end

local function close_win_on_last_buf()
  local buffers = vim.fn.len(vim.fn.filter(vim.fn.range(1, vim.fn.bufnr '$'), 'buflisted(v:val)'))
  if buffers == 1 then
    if #vim.fn.tabpagebuflist() > 1 then
      vim.cmd 'q'
    else
      M.close_all()
    end
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

function M.exec_arg(a, b)
  vim.cmd(string.gsub(string.gsub('a b', 'b', b), 'a', a))
end

function M.buffer(buffer)
  M.exec_arg('buffer', buffer)
end

function M.close()
  if #vim.fn.tabpagebuflist() > 1 then
    close_split()
  else
    close_float_win()
  end
end

function M.close_all()
  if pass_save_criteria() then
    require('auto-session-config/utils').save_session_and_quit()
  else
    vim.cmd 'silent wa|qa'
  end
end

function M.toggle_mouse()
  if vim.go.mouse == '' then
    vim.go.mouse = 'a'
  else
    vim.go.mouse = ''
  end
end

function M.vsplit_back(split)
  if split == 'x' then
    vim.cmd 'split'
  else
    vim.cmd 'vsplit'
  end
  if vim.fn.buflisted(vim.fn.bufname '#') == 1 then
    vim.cmd 'b#'
  end
end

local tabline = 2
local tabpage = 1

function M.toggle_tab()
  if vim.fn.tabpagenr() <= 1 then
    vim.cmd 'tab split'
    tabline = 0
    tabpage = 2
    vim.go.showtabline = tabline
  else
    local originbufferid = vim.fn.bufnr ''
    vim.cmd 'tabc'
    tabline = 2
    tabpage = 1
    vim.go.showtabline = tabline
    M.buffer(originbufferid)
  end
end

function M.split_tab()
  vim.go.showtabline = 0
  if tabpage == 1 then
    vim.cmd 'tab split'
  end
end

function M.close_tab()
  vim.go.showtabline = tabline
  if tabpage == 1 then
    vim.cmd 'tabc'
  end
end

return M
