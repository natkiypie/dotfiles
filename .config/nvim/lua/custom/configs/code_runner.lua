local cr = require 'code_runner'

cr.setup {
  filetype = {
    javascript = 'deno run',
    typescript = 'deno run',
  },
}
