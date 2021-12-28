local M = {}

function M.update()
  if vim.fn.filereadable '/tmp/pack_flag' == 0 then
    local connection_status = vim.fn.system '! echo $(~/.config/scripts/check_connection.sh)'
    if vim.api.nvim_eval(connection_status) == 1 then
      vim.cmd [[
        silent ! touch /tmp/pack_flag
        PackerUpdate
        augroup update
          autocmd!
          autocmd User PackerComplete ++once bd | lua require('utils.init').prompt()
        augroup END
      ]]
    else
      error()
      M.prompt()
    end
  else
    M.prompt()
  end
end

function M.prompt()
  if vim.fn.empty(vim.fn.bufname()) == 1 then
    vim.cmd 'lua require("utils.terminals.broot").open()'
  end
end

return M
