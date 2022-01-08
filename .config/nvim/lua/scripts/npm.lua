local M = {}

local bash = require 'scripts.terminals.bash'

local function set_slime_jobid()
  vim.b.slime_config = { jobid = bash.terminals['/bin/bash'].channel }
end

local function toggle_bash()
  vim.cmd [[
    lua require"scripts.terminals.bash".issue("/bin/bash")
    lua require"scripts.terminals.bash".issue("/bin/bash")
    stopinsert
  ]]
end

function M.start(cmd)
  if repl_alive() then
    error 'Close REPL before using Npm user command'
  else
    if bash.terminals and bash.terminals['/bin/bash'] then
      set_slime_jobid()
    else
      toggle_bash()
      set_slime_jobid()
    end
    cmd = string.gsub('npm cmd', 'cmd', cmd)
    vim.cmd(string.gsub('SlimeSend1 cmd', 'cmd', cmd))
  end
end

return M
