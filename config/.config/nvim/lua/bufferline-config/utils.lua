local M = {}

function M.bufferline_pick()
  vim.cmd [[
    hi BufferLineBufferSelected gui=none guifg=#515a82
    hi BufferLineBackground guifg=#a9b1d6
  ]]
  vim.cmd [[
    BufferLinePick
    hi BufferLineBufferSelected gui=none guifg=#a9b1d6
    hi BufferLineBackground guifg=#515a82
  ]]
end

return M
