-- SEND REGION:
-- require('utils.keybindings').bind_x_mode {
--   { '<C-s>', '<CMD>lua require"floaterm-config.utils".slime("x")<CR>' },
-- }

local M = {}

function M.issue()
  if vim.fn.has 'nvim' == 0 then
    return false
  end

  local function initialize_terminal()
    M.terminal = {
      loaded = false,
      originbufferid = nil,
      termbufferid = nil,
    }
  end

  local function split()
    vim.cmd [[
    vsplit
    wincmd l
  ]]
  end

  local function resize()
    vim.cmd [[
    stopinsert
    vertical-resize 90
  ]]
  end

  local function set_job_id(channel)
    local cmd = string.gsub('silent let b:slime_config = {"jobid": "channel"}', 'channel', channel)
    vim.cmd(cmd)
  end

  if not M.terminal then
    initialize_terminal()
  end

  M.terminal.on_exit = function(_, code)
    if code == 0 then
      buffer(M.terminal.originbufferid)
      exec_arg('Bclose!', M.terminal.termbufferid)
      vim.cmd [[
        wincmd l
        quit
        stopinsert
      ]]
      initialize_terminal()
    end
  end

  local function open()
    local cmd = 'node -e "require(\'repl\').start({ignoreUndefined: true})"'
    split()
    vim.api.nvim_command 'enew'
    vim.fn.termopen(cmd, M.terminal)
    M.terminal['loaded'] = true
    M.terminal['termbufferid'] = vim.fn.bufnr ''
  end

  if not M.terminal.loaded then
    M.terminal.originbufferid = vim.fn.bufnr ''
    open()
    resize()
    local channel = vim.api.nvim_eval '&channel'
    vim.cmd 'wincmd h'
    set_job_id(channel)
    vim.cmd 'SlimeSendCurrentLine'
    return true
  else
    vim.cmd 'SlimeSendCurrentLine'
  end
end

function M.clear()
  vim.cmd [[SlimeSend1 console.log('\u001B\[2J\u001B\[0;0f')]]
end

function M.exit()
  vim.cmd [[
    SlimeSend1 .exit
  ]]
end

return M
