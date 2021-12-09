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
    F.return_winsize()
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

-- check if node term is open first
-- open node floaterm
-- call slime send
-- move back up to file buffer

function F.slime()
  F.toggle{wintype='split', height='0.5', name='REPL', cmd='node'}
  local key = utils.get_table_value(ft_table, 'REPL')
  F.toggle{name='REPL'}
  local cmd = 'silent let b:slime_config = {"jobid": '..key..'}'
  vim.cmd(cmd)
  vim.cmd[[
    SlimeSendCurrentLine
    silent FloatermShow REPL
  ]]
  vim.cmd( 'stopinsert | wincmd k')
end

function F.return_winsize()
  local min_win_height = 19
  local winsize = eval('winheight(0)')
  if winsize > min_win_height then
    F.toggle_winsize()
  end
end

local split_winsize = utils.toggle(
  '--height=0.99',
  '--height=0.5'
)

local float_winsize = utils.toggle(
  '--width=0.99 --height=0.99',
  '--width=0.6 --height=0.6'
)

function F.toggle_winsize()
  local cmd
  local split_list = {REPL='REPL', htop='htop'}
  local channel = eval('&channel')
  local key = utils.get_table_key(ft_table, channel)
  if utils.table_contains(split_list, key) then
    cmd = 'silent FloatermUpdate '..split_winsize()
  else
    cmd = 'silent FloatermUpdate '..float_winsize()
  end
  vim.cmd(cmd)
end

function F.test()
  print('no tests added')
end

return F
