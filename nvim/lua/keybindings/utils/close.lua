-- local blacklist = {"help"}
-- local key = vim.bo.filetype
-- print(blacklist[key] ~= nil )
local M = {}

function M.close_float_win()
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local config = vim.api.nvim_win_get_config(win)
    if config.relative ~= "" then
      vim.api.nvim_win_close(win, false)
      vim.cmd('bd')
    else
      vim.cmd('bd')
    end end
end

return M
