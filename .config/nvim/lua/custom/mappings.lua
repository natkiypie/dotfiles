local expr = require 'custom.expr'
local usercmd = require 'custom.usercmd'

local M = {}

M.buffers = {
  n = {
    ['L'] = { '<cmd> bn <CR>', 'Go to next buffer' },
    ['H'] = { '<cmd> bp <CR>', 'Go to previous buffer' },
    ['<right>'] = usercmd.buf_right,
    ['<left>'] = usercmd.buf_left,
  },
}

M.code_runner = {
  n = {
    ['<C-x>'] = {
      '<cmd> RunCode <CR>',
      'Runs code based on file type, first checking if belongs to project, then if filetype mapping exists',
    },
  },
}

M.comments = {
  n = {
    ['<C-_>'] = { '<cmd>CommentToggle <CR>', 'Toggle comment linewise' },
    ['clp'] = { 'yy:CommentToggle <CR>p', 'Comment line and paste below' },
    ['<C-c><C-p>'] = { '}o<ESC>2kyipvip:CommentToggle <CR>}p', 'Comment block and paste below' },
  },
  v = {
    ['<C-_>'] = { ':CommentToggle <CR>', 'Toggle linewise comment on visual selection' },
    ['<C-c><C-p>'] = { 'yv`]:CommentToggle<CR>`]p', 'Comment visual selection and paste below' },
    ['<C-c><C-y>'] = { 'yv`]:CommentToggle<CR>', 'Comment and yank visual selection' },
  },
}

M.command = {
  n = {
    ['<C-h>'] = { '<cmd> lua print(vim.fn.expand("%:p")) <CR>', 'Print current working directory' },
  },
  c = {
    ['jk'] = { '<esc>', 'Escape command mode' },
    ['K'] = { '<up>', 'Search up through command history' },
    ['J'] = { '<down>', 'Search down through command history' },
    ['L'] = { '<CR>', 'Select item in command history' },
  },
}

M.disabled = {
  n = {
    ['<A-h>'] = '',
    ['<A-i>'] = '',
    ['<A-v>'] = '',
    ['<C-c>'] = '',
    ['<C-h>'] = '',
    ['<C-j>'] = '',
    ['<C-k>'] = '',
    ['<C-l>'] = '',
    ['<C-n>'] = '',
    ['<C-w>'] = '',
    ['<leader>b'] = '',
    ['<leader>cc'] = '',
    ['<leader>gb'] = '',
    ['<leader>gt'] = '',
    ['<leader>n'] = '',
  },
}

M.git = {
  n = {
    ['<leader>g'] = expr.git,
    ['<leader>st'] = { '<cmd> Git status <CR>', 'git status' },
    ['<leader>d'] = expr.diff,
    ['<leader>s'] = { '<cmd> Gitsigns stage_buffer <CR>', 'Stage all hunks in current buffer' },
    ['<leader>rs'] = {
      '<cmd> Gitsigns reset_buffer_index <CR>',
      'Unstage all hunks for current buffer in the index',
    },
    ['<leader>sh'] = { '<cmd> Gitsigns stage_hunk <CR>', 'Stage hunk' },
    ['<leader>rh'] = { '<cmd> Gitsigns undo_stage_hunk <CR>', 'Undo staged hunk' },
    ['<C-c>'] = { '<cmd> Git commit <CR>', 'git commit' },
    ['<C-p>'] = { '<cmd> Git push <CR>', 'git push' },
  },
}

M.nvim_tree = {
  n = {
    ['<leader>e'] = { '<cmd> NvimTreeToggle <CR>', 'Toggle nvimtree' },
  },
}

M.peek = {
  n = {
    ['<leader>md'] = { '<cmd> PeekOpen <CR>', 'Preview Markdown files' },
  },
}

M.splits = {
  n = {
    ['<leader>v'] = usercmd.sp_v,
    ['<leader>x'] = usercmd.sp_h,
    ['>'] = expr.sp_right,
    ['<'] = expr.sp_left,
    ['K'] = expr.sp_up,
    ['J'] = expr.sp_down,
    ['='] = expr.sp_vincrease,
    ['-'] = expr.sp_vdecrease,
    ['+'] = expr.sp_increase,
    ['_'] = expr.sp_decrease,
  },
}

M.tabline = {
  n = {
    ['<CR>'] = usercmd.toggle_tab,
  },
}

M.telescope = {
  n = {
    ['<C-f>'] = { '<cmd> lua require"telescope.builtin".find_files() <CR>', 'Search for files (respecting .gitignore)' },
    ['<C-b>'] = {
      '<cmd> Telescope git_branches initial_mode=normal <CR>',
      'List branches for current directory, with output from git log --oneline shown in the preview window',
    },
    ['<C-k>'] = {
      '<cmd> Telescope keymaps initial_mode=normal <CR>',
      'Lists normal mode keymappings, runs the selected keymap on <cr>',
    },
    ['/'] = {
      '<cmd> Telescope current_buffer_fuzzy_find <CR>',
      'Live fuzzy search inside of the currently open buffer',
      opts = { nowait = true },
    },
  },
}

M.terminal = {
  n = {
    ['<C-t>'] = usercmd.toggle_term,
  },
  t = {
    ['<del>'] = { '<C-\\><C-n>', 'Escape insert mode' },
    ['<C-t>'] = usercmd.toggle_term,
  },
}

M.user = {
  n = {
    ['<C-l>'] = { '<cmd> echo "" <CR>', 'Clear statusline' },
    ['<C-n>'] = usercmd.notes,
    ['<C-q>'] = usercmd.close_all,
    ['<C-s>'] = usercmd.spell,
    ['<C-w>'] = usercmd.write,
    ['M'] = usercmd.mouse,
    ['q'] = expr.quit,
  },
  i = {
    ['jk'] = { '<esc>', 'Escape insert mode', opts = { nowait = true } },
    ['<C-a>'] = { '<esc>la', 'Escape insert mode and append', opts = { nowait = true } },
  },
  v = {
    ['yp'] = { 'y`]o<Esc>p', 'Yank and paste selected text' },
  },
}

M.wildmenu = {
  c = {
    ['<C-k>'] = expr.wm_up,
    ['<C-J>'] = expr.wm_down,
    ['<C-l>'] = expr.wm_select,
    ['<C-h>'] = expr.wm_close,
  },
}

return M
