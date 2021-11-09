-- Sources:
-- https://github.com/hrsh7th/nvim-cmp
-- https://youtu.be/5lPA8LpMytI
vim.g.completeopt = "menu, menuone, noselect, noinsert"

-- Source: https://github.com/hrsh7th/nvim-cmp/wiki/Example-mappings
local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

-- local feedkey = function(key, mode)
--   vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
-- end

-- Setup nvim-cmp
local cmp = require'cmp'

-- Source: https://github.com/onsails/lspkind-nvim
local lspkind = require('lspkind')

cmp.setup({
  -- snippet = {
  --   -- REQUIRED - you must specify a snippet engine
  --   expand = function(args)
  --     vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
  --     require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
  --     vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
  --     require'snippy'.expand_snippet(args.body) -- For `snippy` users.
  --   end,
  -- },
  mapping = {

    ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),

    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),

    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),

    ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.

    ['<C-e>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),

    ['<CR>'] = cmp.mapping.confirm({ select = true }),

    -- Source: https://github.com/hrsh7th/nvim-cmp/wiki/Example-mappings
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_prev_item()
      end
    end, { "i", "s" }),

  },

  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
  }, {
    { name = 'buffer' },
  }),

  -- Source: https://github.com/onsails/lspkind-nvim
  formatting = {
    -- format = lspkind.cmp_format({with_text = false, maxwidth = 50})
    format = lspkind.cmp_format({with_text = true, maxwidth = 50})
 },

})
