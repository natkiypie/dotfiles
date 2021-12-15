local helpers = require 'utils.helpers'

local eval = vim.api.nvim_eval

local F = {}

local ft_table = {}

function F.parse_opts(args)
  local opts = ''
  for k, v in pairs(args) do
    if k ~= 'cmd' and k ~= 'silent' then
      opts = opts .. ' --' .. k .. '=' .. v
    end
  end
  if args.silent then
    opts = '--' .. args.silent .. opts
  end
  if args.cmd then
    opts = opts .. ' ' .. args.cmd
  end
  return opts
end

function F.create(args)
  vim.cmd('silent FloatermNew' .. F.parse_opts(args))
  local channel = eval '&channel'
  local opts = helpers.add_to_table(args, 'channel', channel)
  helpers.add_to_table_silent(ft_table, args.name, opts)
end

function F.hide(args)
  F.return_winsize()
  vim.cmd('silent FloatermHide ' .. args.name)
end

function F.show(args)
  vim.cmd('silent FloatermShow ' .. args.name)
end

function F.handle(args)
  if helpers.table_contains(ft_table, args.name) then
    F.show(args)
  else
    F.create(args)
  end
end

function F.toggle(args)
  local channel = eval '&channel'
  if channel == 0 then
    F.handle(args)
  else
    if helpers.table_contains(ft_table, args.name) then
      F.hide(args)
    end
  end
end

function F.quit()
  local name = helpers.get_nested_table_value(ft_table, 'name')
  helpers.remove_from_table(ft_table, name)
  vim.cmd 'silent FloatermKill'
end

function F.quit_all()
  vim.cmd 'silent FloatermKill!'
  for key in pairs(ft_table) do
    helpers.remove_from_table(ft_table, key)
  end
end

function F.slime_send_current_line()
  F.toggle { wintype = 'vsplit', width = '0.4', name = 'REPL', cmd = 'node' }
  local channel = helpers.get_nested_table_value(ft_table, 'channel')
  F.toggle { name = 'REPL' }
  local cmd = 'silent let b:slime_config = {"jobid": ' .. channel .. '}'
  vim.cmd(cmd)
  vim.cmd [[
    SlimeSendCurrentLine
    silent FloatermShow REPL
  ]]
  vim.cmd 'stopinsert | wincmd h'
end

function F.slime_region_send()
  F.toggle { wintype = 'vsplit', width = '0.4', name = 'REPL', cmd = 'node' }
  local channel = helpers.get_nested_table_value(ft_table, 'channel')
  F.toggle { name = 'REPL' }
  local cmd = 'silent let b:slime_config = {"jobid": ' .. channel .. '}'
  vim.cmd(cmd)
  vim.cmd [[
    lua vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<plug>SlimeRegionSend<cr>',true,false,true),'x',true)
    silent FloatermShow REPL
  ]]
  vim.cmd 'stopinsert | wincmd h'
end

function F.return_winsize()
  local width = eval 'winwidth(0)'
  local height = eval 'winheight(0)'
  local wintype = helpers.get_nested_table_value(ft_table, 'wintype')
  if wintype == 'split' then
    local min_height = 17
    if height > min_height then
      F.toggle_winsize()
    end
  elseif wintype == 'vsplit' then
    local min_width = 58
    if width > min_width then
      F.toggle_winsize()
    end
  else
    local min_height = 19
    if height > min_height then
      F.toggle_winsize()
    end
  end
end

local split_winsize = helpers.toggle('--height=1.0', '--height=0.5')

local vsplit_winsize = helpers.toggle('--width=1.0', '--width=0.4')

local float_winsize = helpers.toggle('--width=1.0 --height=1.0', '--width=0.6 --height=0.6')

function F.toggle_winsize()
  local wintype = helpers.get_nested_table_value(ft_table, 'wintype')
  if wintype == 'split' then
    vim.cmd('silent FloatermUpdate ' .. split_winsize())
  elseif wintype == 'vsplit' then
    vim.cmd('silent FloatermUpdate ' .. vsplit_winsize())
  else
    vim.cmd('silent FloatermUpdate ' .. float_winsize())
  end
end

return F
