---@type ChadrcConfig

local highlights = require 'custom.highlights'

local M = {}

M.ui = {
  theme = 'mountain',

  tabufline = {
    lazyload = false,
  },

  hl_override = highlights.override,
  hl_add = highlights.add,
}

M.mappings = require 'custom.mappings'
M.plugins = 'custom.plugins'

return M
