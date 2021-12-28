local M = {}

function M.close_win_on_last_buf()
  local buffers = vim.fn.len(vim.fn.filter(vim.fn.range(1, vim.fn.bufnr '$'), 'buflisted(v:val)'))
  if buffers == 1 then
    if #vim.fn.tabpagebuflist() > 1 then
      vim.cmd 'q'
    else
      require('auto-session-config.utils').save_session()
    end
  else
    vim.cmd 'bd'
  end
end

function M.close_float_win()
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    if vim.api.nvim_win_get_config(win).relative ~= '' then
      vim.api.nvim_win_close(win, false)
    end
  end
  M.close_win_on_last_buf()
end

function M.toggle_mouse()
  if vim.go.mouse == '' then
    vim.go.mouse = 'a'
  else
    vim.go.mouse = ''
  end
end

local tabline = 2
local tabpage = 1

function M.get_tabline()
  return tabline
end

function M.get_tabpage()
  return tabpage
end

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
    vim.cmd(string.gsub('buffer originbufferid', 'originbufferid', originbufferid))
  end
end

return M
