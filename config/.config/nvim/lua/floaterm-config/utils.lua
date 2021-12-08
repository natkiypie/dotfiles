local utils = require'utils.helpers'

local F = {}

local lookup_table = {}

function F._test()
  local get_id = utils.get_table_contents(lookup_table, 'terminal')
  print(get_id)
end

function F.create_floaterm(key)
  local eval = vim.api.nvim_eval
  vim.cmd('FloatermNew --name='..key)
  local id = eval('&channel')
  utils.add_to_table(lookup_table, key, id)
end

function F.handle_floaterm(key)
  local eval = vim.api.nvim_eval
  local channel = eval('&channel')
  local id = utils.get_table_value(lookup_table, key)
  if channel == id then
    vim.cmd('FloatermHide --name='..key)
  else
    vim.cmd('FloatermShow --name='..key)
  end
end

function F.toggle_floaterm(key)
  if utils.table_contains(lookup_table, key) then
    F.handle_floaterm(key)
  else
    F.create_floaterm(key)
  end
end

function F.quit_test()
  local eval = vim.api.nvim_eval
  local channel = eval('&channel')
  local key = utils.get_table_key(lookup_table, channel)
  utils.remove_from_table(lookup_table, key)
  vim.cmd('FloatermKill')
end

local tf = utils.toggle(
  '--width=0.99 --height=0.99',
  '--width=0.6 --height=0.6'
)
function F.toggle_ft_winsize()
  local cmd = 'FloatermUpdate '..tf()
  vim.cmd(cmd)
end

return F
