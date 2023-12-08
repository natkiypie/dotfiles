local M = {}

local Terminal = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new { cmd = 'lazygitsh', hidden = true }

function M.toggle()
  lazygit:toggle()
end

return M
