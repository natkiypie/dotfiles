local utils = require'utils.helpers'

local eval = vim.api.nvim_eval

local F = {}

local ft_table = {}

function F.parse_opts(args)
  local opts = ''
  for k,v in pairs(args) do
    if k ~= 'cmd' then
      opts = opts..' --'..k..'='..v
    end
  end
  if args.cmd then
    opts = opts..' '..args.cmd
  end
  return opts
end

function F.create(args)
  vim.cmd('FloatermNew'..F.parse_opts(args))
  local id = eval('&channel')
  utils.add_to_table(ft_table, args.name, id)
end

function F.handle(key)
  local channel = eval('&channel')
  local id = utils.get_table_value(ft_table, key)
  if channel == id then
    vim.cmd('FloatermHide '..key)
  elseif channel == 0 then
    vim.cmd('FloatermShow '..key)
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

function F.quit_all()
  vim.cmd('FloatermKill!')
  for key in pairs (ft_table) do
    utils.remove_from_table(ft_table, key)
  end
end

function F.test(args)
  print(F.parse_opts(args))
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
