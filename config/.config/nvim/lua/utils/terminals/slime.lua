local M = {}

-- function M.slime_send(cmd)
--   vim.cmd(cmd)
--   vim.cmd [[
--     silent FloatermShow REPL
--     stopinsert
--     wincmd h
--   ]]
-- end

-- function M.slime(mode)
--   local cmd
--   if mode == 'n' then
--     cmd = 'SlimeSendCurrentLine'
--   else
--     cmd = 'lua vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<plug>SlimeRegionSend",true,false,true),"x",true)'
--   end
--   M.toggle {
--     name = 'REPL',
--     cmd = 'node -e "require(\'repl\').start({ignoreUndefined: true})"',
--     wintype = 'vsplit',
--     width = '0.4',
--   }
--   M.toggle { name = 'REPL' }
--   M.slime_set_job_id()
--   M.slime_send(cmd)
-- end

local function close()
  vim.cmd 'silent! Bclose!'
end

local function exit(_, code)
  if code == 0 then
    close()
  end
end

local function open()
  local cmd = 'node -e "require(\'repl\').start({ignoreUndefined: true})"'
  vim.api.nvim_command 'enew'
  vim.fn.termopen(cmd, { name = 'node', on_exit = exit })
end

function M.test()
  vim.cmd [[
    vsplit
    wincmd l 
  ]]
  open()
  vim.cmd [[
    stopinsert
    vertical-resize 90
  ]]
  local channel = vim.api.nvim_eval '&channel'
  vim.cmd 'wincmd h'
  local set_job_id = string.gsub('silent let b:slime_config = {"jobid": "channel"}', 'channel', channel)
  vim.cmd(set_job_id)
  vim.cmd 'SlimeSendCurrentLine'
end

return M
