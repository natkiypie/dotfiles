local M = {}

M.packer_update = function()
  if vim.fn.filereadable '/tmp/packflag' == 0 then
    local connection_status = vim.fn.system '! echo $(~/.config/scripts/check_connection.sh)'
    if vim.api.nvim_eval(connection_status) == 1 then
      vim.cmd [[
        silent ! touch /tmp/packflag
        PackerUpdate
      ]]
    end
  end
end

return M
