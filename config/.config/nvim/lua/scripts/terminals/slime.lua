local M = {}

function M.send(mode)
  if vim.fn.has 'nvim' == 0 then
    return false
  end

  local function initialize_terminal()
    M.terminal = {
      loaded = false,
      originbufferid = nil,
      termbufferid = nil,
      channel = nil,
    }
  end

  local function split()
    vim.cmd [[
      vsplit
      wincmd l
    ]]
  end

  local function unsplit()
    vim.cmd [[
      wincmd l
      quit
      stopinsert
    ]]
  end

  local function resize()
    vim.cmd [[
      stopinsert
      vertical-resize 90
      wincmd h
    ]]
  end

  local function set_job_id(channel)
    vim.cmd(string.gsub('silent let b:slime_config = {"jobid": "channel"}', 'channel', channel))
  end

  local function slime_send()
    local cmd
    if mode == 'n' then
      cmd = 'SlimeSendCurrentLine'
    elseif mode == 'x' then
      cmd =
        'lua vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<plug>SlimeRegionSend",true,false,true),"x",true)'
    end
    vim.cmd(cmd)
  end

  if not M.terminal then
    initialize_terminal()
  end

  M.terminal.on_exit = function(_, code)
    if code == 0 then
      buffer(M.terminal.originbufferid)
      exec_arg('Bclose!', M.terminal.termbufferid)
      unsplit()
      initialize_terminal()
    end
  end

  local function open()
    local node = 'node -e "require(\'repl\').start({ignoreUndefined: true})"'
    split()
    vim.api.nvim_command 'enew'
    vim.fn.termopen(node, M.terminal)
    vim.bo.ft = 'terminal'
    vim.cmd 'startinsert'
    M.terminal['loaded'] = true
    M.terminal['termbufferid'] = vim.fn.bufnr ''
    M.terminal['channel'] = vim.api.nvim_eval '&channel'
  end

  if not M.terminal.loaded then
    M.terminal.originbufferid = vim.fn.bufnr ''
    open()
    resize()
    set_job_id(M.terminal.channel)
    slime_send()
    return true
  else
    slime_send()
  end
end

function M.help()
  vim.cmd [[SlimeSend1 .help]]
end

function M.clear()
  vim.cmd [[SlimeSend1 console.log('\u001B\[2J\u001B\[0;0f')]]
end

function M.exit()
  vim.cmd [[SlimeSend1 .exit]]
end

return M
