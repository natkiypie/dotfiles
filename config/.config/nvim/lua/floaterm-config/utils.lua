local helpers = require 'utils.helpers'

local M = {}

M.ft_table = {}

local function parse_args(args)
  local opts = ''
  for k, v in pairs(args) do
    if k ~= 'cmd' then
      opts = opts .. ' --' .. k .. '=' .. v
    end
  end
  if args.cmd then
    opts = opts .. ' ' .. args.cmd
  end
  return opts
end

local function create(args)
  vim.cmd(string.gsub('silent FloatermNew args', 'args', parse_args(args)))
  helpers.add_to_table_silent(
    M.ft_table,
    args.name,
    helpers.add_to_table(args, 'channel', vim.api.nvim_eval '&channel')
  )
end

local function return_winsize()
  local max = '1.0'
  if helpers.get_nested_table_value(M.ft_table, 'wintype') == 'split' then
    if helpers.get_nested_table_value(M.ft_table, 'height') == max then
      M.toggle_winsize()
    end
  elseif helpers.get_nested_table_value(M.ft_table, 'width') == max then
    M.toggle_winsize()
  end
end

local function hide(args)
  return_winsize()
  vim.cmd(string.gsub('silent FloatermHide name', 'name', args.name))
end

local function show(args)
  vim.cmd(string.gsub('silent FloatermShow name', 'name', args.name))
end

local function handle(args)
  if helpers.table_contains(M.ft_table, args.name) then
    show(args)
  else
    create(args)
  end
end

function M.toggle(args)
  if vim.api.nvim_eval '&channel' == 0 then
    handle(args)
  else
    if helpers.table_contains(M.ft_table, args.name) then
      hide(args)
    end
  end
end

function M.quit()
  helpers.remove_from_table(M.ft_table, helpers.get_nested_table_value(M.ft_table, 'name'))
  vim.cmd 'silent FloatermKill'
end

function M.quit_all()
  vim.cmd 'silent FloatermKill!'
  for key in pairs(M.ft_table) do
    helpers.remove_from_table(M.ft_table, key)
  end
end

function M.slime_send_current_line()
  M.toggle {
    name = 'REPL',
    cmd = 'node -e "require(\'repl\').start({ignoreUndefined: true})"',
    wintype = 'vsplit',
    width = '0.4',
  }
  M.toggle { name = 'REPL' }
  local channel = helpers.get_nested_table_value(M.ft_table, 'channel')
  local set_job_id = string.gsub('silent let b:slime_config = {"jobid": channel}', 'channel', channel)
  vim.cmd(set_job_id)
  vim.cmd [[
    SlimeSendCurrentLine
    silent FloatermShow REPL
    stopinsert
    wincmd h
  ]]
end

function M.slime_region_send()
  M.toggle {
    name = 'REPL',
    cmd = 'node -e "require(\'repl\').start({ignoreUndefined: true})"',
    wintype = 'vsplit',
    width = '0.4',
  }
  M.toggle { name = 'REPL' }
  local channel = helpers.get_nested_table_value(M.ft_table, 'channel')
  local cmd = string.gsub('silent let b:slime_config = {"jobid": channel}', 'channel', channel)
  vim.cmd(cmd)
  vim.cmd [[
    lua vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<plug>SlimeRegionSend<cr>',true,false,true),'x',true)
    silent FloatermShow REPL
    stopinsert
    wincmd h
  ]]
end

local function _toggle_winsize(term, min)
  local max = '1.0'
  if term == min then
    return max
  else
    return min
  end
end

function M.toggle_winsize()
  local wintype = helpers.get_nested_table_value(M.ft_table, 'wintype')
  if wintype == 'split' then
    local min = '0.5'
    local height = helpers.get_nested_table_value(M.ft_table, 'height')
    vim.cmd(string.gsub('silent FloatermUpdate --height=winheight', 'winheight', _toggle_winsize(height, min)))
    helpers.update_nested_table_value(M.ft_table, height, _toggle_winsize(height, min))
  elseif wintype == 'vsplit' then
    local min = '0.4'
    local width = helpers.get_nested_table_value(M.ft_table, 'width')
    vim.cmd(string.gsub('silent FloatermUpdate --width=winwidth', 'winwidth', _toggle_winsize(width, min)))
    helpers.update_nested_table_value(M.ft_table, width, _toggle_winsize(width, min))
  else
    local min = '0.6'
    local width = helpers.get_nested_table_value(M.ft_table, 'width')
    vim.cmd(string.gsub('silent FloatermUpdate --width=windim --height=windim', 'windim', _toggle_winsize(width, min)))
    helpers.update_nested_table_value(M.ft_table, width, _toggle_winsize(width, min))
  end
end

return M
