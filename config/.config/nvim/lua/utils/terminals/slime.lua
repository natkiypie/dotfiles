-- WIP:
-- 1. open split terminal
-- 2. get channel #
-- 3. toggle terminal
-- 4. set job id to channel #
-- 5. issue slime send current line or region

local M = {}

-- function M.slime_set_job_id()
--   local channel = require('utils.table').get_nested_value(M.ft_table, 'channel')
--   local set_job_id = string.gsub('silent let b:slime_config = {"jobid": channel}', 'channel', channel)
--   vim.cmd(set_job_id)
-- end

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

return M
