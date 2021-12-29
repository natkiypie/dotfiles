local M = {}

-- local function close()
--   vim.cmd 'silent! Bclose!'
-- end

-- local function exit(_, code)
--   if code == 0 then
--     close()
--   end
-- end

-- local function open()
--   local cmd = 'node -e "require(\'repl\').start({ignoreUndefined: true})"'
--   vim.api.nvim_command 'enew'
--   vim.fn.termopen(cmd, { name = 'node', on_exit = exit })
-- end

-- function M.test()
--   vim.cmd [[
--     vsplit
--     wincmd l
--   ]]
--   open()
--   vim.cmd [[
--     stopinsert
--     vertical-resize 90
--   ]]
--   local channel = vim.api.nvim_eval '&channel'
--   vim.cmd 'wincmd h'
--   local set_job_id = string.gsub('silent let b:slime_config = {"jobid": "channel"}', 'channel', channel)
--   vim.cmd(set_job_id)
--   vim.cmd 'SlimeSendCurrentLine'
-- end

function M.test()
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

  local function set_job_id()
    local channel = vim.api.nvim_eval '&channel'
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
      ]]
      initialize_terminal()
    end
  end

  local function open()
    local cmd = 'node -e "require(\'repl\').start({ignoreUndefined: true})"'
    split()
    vim.api.nvim_command 'enew'
    vim.fn.termopen(cmd, M.terminal)
    resize()
    set_job_id()
  end

  if not M.terminal.loaded then
    M.terminal.originbufferid = vim.fn.bufnr ''
    open()
    M.terminal['loaded'] = true
    M.terminal['termbufferid'] = vim.fn.bufnr ''
    vim.cmd 'wincmd h'
    return true
  end

  -- if terminal is shown in window then
  ---- hide terminal buffer
  -- else
  ---- show terminal buffer
  -- end
  if vim.fn.empty(vim.fn.win_findbuf(M.terminal.termbufferid)) == 1 then
    split()
    buffer(M.terminal.termbufferid)
    resize()
    vim.cmd 'wincmd h'
  else
    vim.cmd [[
      wincmd l
      stopinsert
      quit
    ]]
  end

  -- if M.terminal.termbufferid == vim.fn.bufnr '' then
  --   split()
  --   resize()
  --   buffer(M.terminal.originbufferid)
  --   vim.cmd 'startinsert'
  -- else
  --   M.terminal.originbufferid = vim.fn.bufnr ''
  --   buffer(M.terminal.termbufferid)
  --   vim.cmd 'quit'
  -- end
end

return M
