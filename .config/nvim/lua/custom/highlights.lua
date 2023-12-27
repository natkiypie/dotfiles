local M = {}

M.override = {}

M.add = {}

M.leap = {
  vim.api.nvim_set_hl(0, 'LeapBackdrop', { link = 'Comment' }),
  vim.api.nvim_set_hl(0, 'LeapMatch', {
    fg = 'white',
    bold = true,
    nocombine = true,
  }),

  vim.api.nvim_set_hl(0, 'LeapLabelPrimary', {
    fg = '#f02077',
    bold = true,
    nocombine = true,
  }),
  vim.api.nvim_set_hl(0, 'LeapLabelSecondary', {
    fg = '#399d9f',
    bold = true,
    nocombine = true,
  }),
}

return M
