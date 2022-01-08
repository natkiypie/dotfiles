local M = {}

local function update_packages()
  vim.cmd [[
    silent ! touch /tmp/pack_flag
    PackerUpdate
    augroup update
      autocmd!
      autocmd User PackerComplete ++once lua require('scripts.initialize').resume()
    augroup END
  ]]
end

local function check_connection()
  local connection_status = vim.fn.system '! echo $(~/.scripts/check_connection.sh)'
  if vim.api.nvim_eval(connection_status) ~= 1 then
    error()
  end
end

function M.check_flag()
  if vim.fn.filereadable '/tmp/pack_flag' == 0 then
    if pcall(check_connection) then
      update_packages()
    else
      M.prompt()
    end
  else
    M.prompt()
  end
end

function M.resume()
  vim.cmd [[
    augroup resume
      autocmd!
      autocmd BufEnter * ++once lua require("scripts.initialize").prompt()
    augroup END
  ]]
end

function M.prompt()
  if vim.fn.empty(vim.fn.bufname()) == 1 then
    vim.cmd 'lua require("scripts.terminals.broot").open()'
  end
end

return M
