local M = {}

local function commands()
  local diagnostics_border = {
    { '┌', 'FloatBorder' },
    { '─', 'FloatBorder' },
    { '┐', 'FloatBorder' },
    { '│', 'FloatBorder' },
    { '┘', 'FloatBorder' },
    { '─', 'FloatBorder' },
    { '└', 'FloatBorder' },
    { '│', 'FloatBorder' },
  }
  vim.cmd [[
    command! LspDef lua vim.lsp.buf.definition()
    command! LspRef lua vim.lsp.buf.references()
    command! LspFormatting lua vim.lsp.buf.formatting()
    command! LspCodeAction lua vim.lsp.buf.code_action()
    command! LspHover lua vim.lsp.buf.hover()
    command! LspRename lua vim.lsp.buf.rename()
    command! LspRefs lua vim.lsp.buf.references()
    command! LspTypeDef lua vim.lsp.buf.type_definition()
    command! LspImplementation lua vim.lsp.buf.implementation()
    command! LspDiag lua vim.diagnostic.show()
    command! LspSignatureHelp lua vim.lsp.buf.signature_help()
  ]]
  vim.cmd(string.gsub('command! LspDiagLine lua vim.diagnostic.open_float({border=diagnostics_border, focusable=false})', 'diagnostics_border', vim.inspect(diagnostics_border)))
end

local buf_map = function(bufnr, mode, lhs, rhs, opts)
  vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts or {
    silent = true,
  })
end

local function keybindings(bufnr)
  buf_map(bufnr, 'n', '<Leader>d', ':LspDef<CR>')
  buf_map(bufnr, 'n', '<Leader>r', ':LspRef<CR>')
  buf_map(bufnr, 'n', '<Leader>e', ':LspRename<CR>')
  buf_map(bufnr, 'n', '<Leader>y', ':LspTypeDef<CR>')
  buf_map(bufnr, 'n', '<Leader>k', ':LspHover<CR>')
  buf_map(bufnr, 'n', '<Leader>a', ':LspCodeAction<CR>')
  buf_map(bufnr, 'n', '<Leader>l', ':LspDiagLine<CR>')
  buf_map(bufnr, 'n', '<Leader>z', ':LspRestart<CR>')
  buf_map(bufnr, 'i', '<C-s>', '<CMD>LspSignatureHelp<CR>')
end

local function highlight(client)
  if client.resolved_capabilities.document_highlight then
    vim.o.updatetime = 400
    vim.cmd [[
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]]
  end
end

local function disable_native_formatting(client)
  client.resolved_capabilities.document_formatting = false
  client.resolved_capabilities.document_range_formatting = false
end

local function ts_utils(client, bufnr)
  local ts_utils = require 'nvim-lsp-ts-utils'
  ts_utils.setup {}
  ts_utils.setup_client(client)
  buf_map(bufnr, 'n', '<Leader>o', ':TSLspOrganize<CR>')
  buf_map(bufnr, 'n', '<Leader>f', ':TSLspRenameFile<CR>')
  buf_map(bufnr, 'n', '<Leader>i', ':TSLspImportAll<CR>')
end

-- require("null-ls").setup({
--     -- you can reuse a shared lspconfig on_attach callback here
--     on_attach = function(client)
--         if client.resolved_capabilities.document_formatting then
--             vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
--         end
--     end,
-- })

-- FOR LUA FORMATTING
-- local on_attach = function(client, bufnr)
--   utils.disable_native_formatting(client)
--   utils.commands()
--   utils.keybindings(bufnr)
--   utils.format(client)
-- end

  -- local sources
  -- if filetype == 'lua' then
  --   sources = {
  --     null_ls.builtins.formatting.stylua.with {
  --       extra_args = { '--config-path', vim.fn.expand '~/.config/nvim/.stylua.toml' },
  --     },
  --   }
  -- else
  -- end

local function format(client)
  local config = client['config']
  local filetypes = config['filetypes']
  local filetype = filetypes[1]
  local null_ls = require 'null-ls'
  local sources = {
    null_ls.builtins.diagnostics.eslint_d,
    null_ls.builtins.code_actions.eslint_d,
    null_ls.builtins.formatting.prettierd,
  }
  null_ls.setup {
    sources = sources,
    ---@diagnostic disable-next-line: redefined-local
    on_attach = function(client)
      if client.resolved_capabilities.document_formatting then
        vim.cmd [[
          augroup null_ls_formatting_sync
            autocmd! * <buffer>
            autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
          augroup END
        ]]
      end
      vim.cmd 'echo ""'
    end,
  }
end

M.on_attach_typescript = function(client, bufnr)
  disable_native_formatting(client)
  commands()
  keybindings(bufnr)
  highlight(client)
  ts_utils(client, bufnr)
  format(client)
end

M.on_attach_html = function(client, bufnr)
  disable_native_formatting(client)
  commands()
  keybindings(bufnr)
  highlight(client)
  format(client)
end

M.on_attach_css = function(client, bufnr)
  disable_native_formatting(client)
  commands()
  keybindings(bufnr)
  format(client)
end


return M
