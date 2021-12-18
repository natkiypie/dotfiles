local helpers = require 'utils.helpers'

local ft_table = {}

local M = {}

local function parse_opts(args)
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

local function create(args)
  vim.cmd('silent FloatermNew' .. parse_opts(args))
  helpers.add_to_table_silent(ft_table, args.name, helpers.add_to_table(args, 'channel', vim.api.nvim_eval '&channel'))
end

local function return_winsize()
  local max = '1.0'
  if helpers.get_nested_table_value(ft_table, 'wintype') == 'split' then
    if helpers.get_nested_table_value(ft_table, 'height') == max then
      M.toggle_winsize()
    end
  elseif helpers.get_nested_table_value(ft_table, 'width') == max then
    M.toggle_winsize()
  end
end

local function hide(args)
  return_winsize()
  vim.cmd('silent FloatermHide ' .. args.name)
end

local function show(args)
  vim.cmd('silent FloatermShow ' .. args.name)
end

local function handle(args)
  if helpers.table_contains(ft_table, args.name) then
    show(args)
  else
    create(args)
  end
end

function M.toggle(args)
  if vim.api.nvim_eval '&channel' == 0 then
    handle(args)
  else
    if helpers.table_contains(ft_table, args.name) then
      hide(args)
    end
  end
end

function M.quit()
  helpers.remove_from_table(ft_table, helpers.get_nested_table_value(ft_table, 'name'))
  vim.cmd 'silent FloatermKill'
end

function M.quit_all()
  vim.cmd 'silent FloatermKill!'
  for key in pairs(ft_table) do
    helpers.remove_from_table(ft_table, key)
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
  local cmd = 'silent let b:slime_config = {"jobid": ' .. helpers.get_nested_table_value(ft_table, 'channel') .. '}'
  vim.cmd(cmd)
  vim.cmd [[
    SlimeSendCurrentLine
    silent FloatermShow REPL
  ]]
  vim.cmd 'stopinsert | wincmd h'
end

function M.slime_region_send()
  M.toggle {
    name = 'REPL',
    cmd = 'node -e "require(\'repl\').start({ignoreUndefined: true})"',
    wintype = 'vsplit',
    width = '0.4',
  }
  M.toggle { name = 'REPL' }
  local cmd = 'silent let b:slime_config = {"jobid": ' .. helpers.get_nested_table_value(ft_table, 'channel') .. '}'
  vim.cmd(cmd)
  vim.cmd [[
    lua vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<plug>SlimeRegionSend<cr>',true,false,true),'x',true)
    silent FloatermShow REPL
  ]]
  vim.cmd 'stopinsert | wincmd h'
end

function M.clear_repl(repl)
  if helpers.table_contains(ft_table, repl) then
    vim.cmd [[FloatermSend --name=REPL console.log("\u001B[2J\u001B[0;0f");]]
  else
    print 'no repl found'
  end
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
  local wintype = helpers.get_nested_table_value(ft_table, 'wintype')
  if wintype == 'split' then
    local min = '0.5'
    local height = helpers.get_nested_table_value(ft_table, 'height')
    vim.cmd('silent FloatermUpdate --height=' .. _toggle_winsize(height, min))
    helpers.update_nested_table_value(ft_table, height, _toggle_winsize(height, min))
  elseif wintype == 'vsplit' then
    local min = '0.4'
    local width = helpers.get_nested_table_value(ft_table, 'width')
    vim.cmd('silent FloatermUpdate --width=' .. _toggle_winsize(width, min))
    helpers.update_nested_table_value(ft_table, width, _toggle_winsize(width, min))
  else
    local min = '0.6'
    local width = helpers.get_nested_table_value(ft_table, 'width')
    vim.cmd(
      'silent FloatermUpdate --width=' .. _toggle_winsize(width, min) .. ' --height=' .. _toggle_winsize(width, min)
    )
    helpers.update_nested_table_value(ft_table, width, _toggle_winsize(width, min))
  end
end

function _G.no_q(key, char)
  if vim.api.nvim_eval '&channel' ~= 0 then
    if
      helpers.table_contains_value({ 'htop', 'Glow', 'LazyGit' }, helpers.get_nested_table_value(ft_table, 'name'))
    then
      return vim.api.nvim_replace_termcodes(key, true, true, true)
    else
      return char
    end
  end
end

return M
