local M = {}

function M.close_win_on_last_buf()
  local eval = vim.api.nvim_eval
  local buffers = eval("len(filter(range(1, bufnr('$')), 'buflisted(v:val)'))")
  if buffers == 1 then
    vim.cmd('q')
  else
    vim.cmd('bd')
  end
end

function M.close_float_win()
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local config = vim.api.nvim_win_get_config(win)
    if config.relative ~= "" then
      vim.api.nvim_win_close(win, false)
    end end
  M.close_win_on_last_buf()
end

function M.toggle (a, b)
  local x = b
  return function ()
    if x == a then x = b else x = a end
    return x
  end
end

-- Toggle mouse
local tm = M.toggle('a', '')
function M.toggle_mouse()
  local cmd = 'set mouse='..tm()
  vim.cmd(cmd)
end

-- Toggle floaterm winsize
local tf = M.toggle(
  '--width=0.99 --height=0.99',
  '--width=0.6 --height=0.6'
)
function M.toggle_ft_winsize()
  local cmd = 'FloatermUpdate '..tf()
  vim.cmd(cmd)
end

-- Toggle tabline file path
local tp = M.toggle(
  '+=%=\\ %M\\ %f',
  '+=%=\\ %M\\ %t'
)
function M.toggle_path()
  local cmd = 'set tabline=|set tabline'..tp()
  vim.cmd(cmd)
end

local floaterm_lookup_table = {}

function M.add_to_set(set, key, value)
  set[key] = value
end

function M.remove_from_set(set, key)
  set[key] = nil
end

function M.set_contains(set, key)
  return set[key] ~= nil
end

function M.get_set_contents(set, key)
  for k,v in pairs(set) do
    if k == key then
    return v
  end
  end
end

function M._test()
  local get_id = M.get_set_contents(floaterm_lookup_table, 'terminal')
  print(get_id)
end

function M.create_floaterm(key)
  local eval = vim.api.nvim_eval
  vim.cmd('FloatermNew --name='..key)
  local id = eval('&channel')
  M.add_to_set(floaterm_lookup_table, key, id)
end

function M.handle_floaterm(key)
  local eval = vim.api.nvim_eval
  local channel = eval('&channel')
  local id = M.get_set_contents(floaterm_lookup_table, key)
  if channel == id then
    vim.cmd('FloatermHide --name='..key)
  else
    vim.cmd('FloatermShow --name='..key)
  end
end

function M.toggle_test(key)
  if M.set_contains(floaterm_lookup_table, key) then
    M.handle_floaterm(key)
  else
    M.create_floaterm(key)
  end
end

return M
