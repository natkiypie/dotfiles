local utils = require'utils.helpers'

local eval = vim.api.nvim_eval

local F = {}

local ft_table = {}

function F.parse_opts(args)
  local opts = ''
  for k,v in pairs(args) do
    if k ~= 'cmd' and k ~= 'silent' then
      opts = opts..' --'..k..'='..v
    end
  end
  if args.silent then
    opts = '--'..args.silent..opts
  end
  if args.cmd then
    opts = opts..' '..args.cmd
  end
  return opts
end

function F.create(args)
  vim.cmd('silent FloatermNew'..F.parse_opts(args))
  local id = eval('&channel')
  utils.add_to_table(ft_table, args.name, id)
end

function F.handle(key)
  local channel = eval('&channel')
  local id = utils.get_table_value(ft_table, key)
  if channel == id then
    F.return_winsize(key)
    vim.cmd('silent FloatermHide '..key)
  elseif channel == 0 then
    vim.cmd('silent FloatermShow '..key)
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
  vim.cmd('silent FloatermKill')
end

function F.quit_all()
  vim.cmd('silent FloatermKill!')
  for key in pairs (ft_table) do
    utils.remove_from_table(ft_table, key)
  end
end

function F.slime()
  vim.g.floaterm_autoinsert = false
  F.toggle{wintype='split', height='0.5', name='REPL', cmd='node'}
  local key = utils.get_table_value(ft_table, 'REPL')
  F.toggle{name='REPL'}
  local cmd = 'silent let b:slime_config = {"jobid": '..key..'}'
  vim.cmd(cmd)
  print("Node.js REPL is alive @ channel "..key)
  vim.g.floaterm_autoinsert = true
end

function F.return_winsize(key)
  local min_win_height = 19
  local winsize = eval('winheight(0)')
  if winsize > min_win_height then
    F.toggle_winsize(key)
  end
end

local float_winsize = utils.toggle(
  '--width=0.99 --height=0.99',
  '--width=0.6 --height=0.6'
)

local split_winsize = utils.toggle(
  '--height=0.99',
  '--height=0.5'
)

function F.toggle_winsize(key)
  local cmd
  local split_list = {'REPL', 'htop'}
  if utils.table_contains(split_list, key) == nil then
    cmd = 'silent FloatermUpdate '..float_winsize()
  else
    cmd = 'silent FloatermUpdate '..split_winsize()
  end
  vim.cmd(cmd)
end

function F.test()
  local win_width = eval('winwidth(0)')
  local win_height = eval('winheight(0)')
  local id = eval('&channel')
  local key = utils.get_table_key(ft_table, id)
  print(key, 'width:', win_width, 'height:', win_height)
end

return F
