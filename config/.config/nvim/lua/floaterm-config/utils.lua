local helpers = require 'utils.helpers'

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
  local eval = vim.api.nvim_eval
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
  local eval = vim.api.nvim_eval
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
  F.toggle { wintype = 'vsplit', width = '0.4', height = '1.0', name = 'REPL', cmd = 'node' }
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
  F.toggle { wintype = 'vsplit', width = '0.4', height = '1.0', name = 'REPL', cmd = 'node' }
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

-- TODO: get width and height directly from current floaterm's table
-- local term_height = helpers.get_nested_table_value(ft_table, 'height')
-- local term_width = helpers.get_nested_table_value(ft_table, 'width')
function F.return_winsize()
  local eval = vim.api.nvim_eval
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

function F._toggle_winsize(term_dim, min)
  local max = '1.0'
  if term_dim == min then
    return max
  else
    return min
  end
end

function F.toggle_winsize()
  local wintype = helpers.get_nested_table_value(ft_table, 'wintype')
  if wintype == 'split' then
    local split_min = '0.5'
    local term_height = helpers.get_nested_table_value(ft_table, 'height')
    local val = F._toggle_winsize(term_height, split_min)
    vim.cmd('silent FloatermUpdate --height=' .. val)
    helpers.update_nested_table_value(ft_table, term_height, val)
  elseif wintype == 'vsplit' then
    local vsplit_min = '0.4'
    local term_width = helpers.get_nested_table_value(ft_table, 'width')
    local val = F._toggle_winsize(term_width, vsplit_min)
    vim.cmd('silent FloatermUpdate --width=' .. val)
    helpers.update_nested_table_value(ft_table, term_width, val)
  else
    local float_min = '0.6'
    local term_width = helpers.get_nested_table_value(ft_table, 'width')
    local val = F._toggle_winsize(term_width, float_min)
    vim.cmd('silent FloatermUpdate --width=' .. val .. ' --height=' .. val)
    helpers.update_nested_table_value(ft_table, term_width, val)
  end
end

return F
