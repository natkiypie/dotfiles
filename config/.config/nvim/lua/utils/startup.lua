local M = {}

local function packer_update()
  if vim.fn.filereadable '/tmp/pack_flag' == 0 then
    local connection_status = vim.fn.system '! echo $(~/.config/scripts/check_connection.sh)'
    if vim.api.nvim_eval(connection_status) == 1 then
      vim.cmd [[
        silent ! touch /tmp/pack_flag
        PackerUpdate
        augroup packer_update
          autocmd!
          autocmd User PackerComplete ++once bd | lua require('utils.startup').prompt()
        augroup END
      ]]
    end
  else
    M.prompt()
  end
end

function M.prompt()
  if vim.fn.empty(vim.fn.bufname()) == 1 then
    vim.cmd 'Telescope find_files'
  end
end

function M.startup()
  packer_update()
end

return M
