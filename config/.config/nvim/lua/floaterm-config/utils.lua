local utils = require'utils.helpers'

local eval = vim.api.nvim_eval

local F = {}

local ft_table = {}

function F.create(args)
  if args.cmd then
    vim.cmd('FloatermNew --name='..args.name..' '..args.cmd)
  else
    vim.cmd('FloatermNew --name='..args.name)
  end
  local id = eval('&channel')
  utils.add_to_table(ft_table, args.name, id)
end

function F.handle(key)
  local channel = eval('&channel')
  local id = utils.get_table_value(ft_table, key)
  if channel == id then
    vim.cmd('FloatermHide --name='..key)
  else
    vim.cmd('FloatermShow --name='..key)
  end
end

function F.toggle(args)
  local channel = eval('&channel')
  if utils.table_contains(ft_table, args.name) then
    F.handle(args.name)
  elseif channel == 0 then
    F.create(args)
  end
end

function F.quit()
  local id = eval('&channel')
  local key = utils.get_table_key(ft_table, id)
  utils.remove_from_table(ft_table, key)
  vim.cmd('FloatermKill')
end

function F.test(args)
  print('name: '..args.name)
  if args.cmd then
    print('cmd: '..args.cmd)
  end
end

local tf = utils.toggle(
  '--width=0.99 --height=0.99',
  '--width=0.6 --height=0.6'
)
function F.toggle_winsize()
  local cmd = 'FloatermUpdate '..tf()
  vim.cmd(cmd)
end

return F
