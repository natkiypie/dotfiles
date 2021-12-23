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
  -- WIP...
  helpers.add_to_table_silent(M.ft_table, args.name, helpers.add_to_table(args, 'resize', true))
end

local function hide(args)
  vim.cmd(string.gsub('silent FloatermHide name', 'name', args.name))
end

-- WIP...
-- I need to make sure this is what I want before I do all the work
-- Now, have to account for:
---- if buffer is already full screen...
---- if file is opened when terminal is in full screen (how to do this 🤨)
---- maybe keep quit function and check screensize before quitting (if full, toggle_tab before quitting)
local function resize(args)
  local min = 17
  local flag = helpers.get_nested_table_value(M.ft_table, 'resize')
  if vim.fn.winheight '$' <= min and flag then
    helpers.update_nested_table_value(M.ft_table, flag, false)
    -- NEW
    vim.cmd 'stopinsert'
    vim.cmd 'tab split'
    if vim.go.showtabline == 2 then
      vim.go.showtabline = 0
    end
    -- vim.cmd 'stopinsert | lua require"keybindings.utils".toggle_tab()'
    vim.api.nvim_feedkeys('i', 'n', true)
  elseif vim.fn.winheight '$' <= min and flag == false then
    helpers.update_nested_table_value(M.ft_table, flag, true)
    hide(args)
  else
    -- NEW
    vim.cmd 'stopinsert'
    vim.cmd 'tabc'
    if vim.go.showtabline == 0 then
      vim.go.showtabline = 2
    end
    -- vim.cmd 'stopinsert | lua require"keybindings.utils".toggle_tab()'
    vim.api.nvim_feedkeys('i', 'n', true)
  end
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
      -- WIP...
      resize(args)
      -- hide(args)
    end
  end
end

-- WIP...
function M.quit()
  if vim.fn.tabpagenr() > 1 then
    vim.cmd 'tabc'
    vim.go.showtabline = 2
  end
  helpers.remove_from_table(M.ft_table, helpers.get_nested_table_value(M.ft_table, 'name'))
  vim.cmd 'silent FloatermKill'
end

-- WIP...
-- THIS MAY BE USED IN AUTOCMD (VimLeavePre) 👇
-- function M.quit_all()
--   vim.cmd 'silent FloatermKill!'
--   for key in pairs(M.ft_table) do
--     helpers.remove_from_table(M.ft_table, key)
--   end
-- end

function M.slime_set_job_id()
  local channel = helpers.get_nested_table_value(M.ft_table, 'channel')
  local set_job_id = string.gsub('silent let b:slime_config = {"jobid": channel}', 'channel', channel)
  vim.cmd(set_job_id)
end

function M.slime_send(cmd)
  vim.cmd(cmd)
  vim.cmd [[
    silent FloatermShow REPL
    stopinsert
    wincmd h
  ]]
end

function M.slime(mode)
  local cmd
  if mode == 'n' then
    cmd = 'SlimeSendCurrentLine'
  else
    cmd = 'lua vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<plug>SlimeRegionSend",true,false,true),"x",true)'
  end
  M.toggle {
    name = 'REPL',
    cmd = 'node -e "require(\'repl\').start({ignoreUndefined: true})"',
    wintype = 'vsplit',
    width = '0.4',
  }
  M.toggle { name = 'REPL' }
  M.slime_set_job_id()
  M.slime_send(cmd)
end

-- function M.toggle_winsize()
--   local wintype = helpers.get_nested_table_value(M.ft_table, 'wintype')
--   if wintype == 'split' then
--     local min = '0.5'
--     local height = helpers.get_nested_table_value(M.ft_table, 'height')
--     vim.cmd(string.gsub('silent FloatermUpdate --height=winheight', 'winheight', _toggle_winsize(height, min)))
--     helpers.update_nested_table_value(M.ft_table, height, _toggle_winsize(height, min))
--   elseif wintype == 'vsplit' then
--     local min = '0.4'
--     local width = helpers.get_nested_table_value(M.ft_table, 'width')
--     vim.cmd(string.gsub('silent FloatermUpdate --width=winwidth', 'winwidth', _toggle_winsize(width, min)))
--     helpers.update_nested_table_value(M.ft_table, width, _toggle_winsize(width, min))
--   else
--     local min = '0.6'
--     local width = helpers.get_nested_table_value(M.ft_table, 'width')
--     vim.cmd(string.gsub('silent FloatermUpdate --width=windim --height=windim', 'windim', _toggle_winsize(width, min)))
--     helpers.update_nested_table_value(M.ft_table, width, _toggle_winsize(width, min))
--   end
-- end

return M
