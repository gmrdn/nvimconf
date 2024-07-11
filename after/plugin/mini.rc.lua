-- require('mini.completion').setup()
require('mini.cursorword').setup()
require('mini.extra').setup()
require('mini.files').setup({
  -- content = {
  --   sort = function(entries)
  --       -- technically can filter entries here too, and checking gitignore for _every entry individually_
  --       -- like I would have to in `content.filter` above is too slow. Here we can give it _all_ the entries
  --       -- at once, which is much more performant.
  --       local all_paths = table.concat(
  --         vim.tbl_map(function(entry)
  --           return entry.path
  --         end, entries),
  --         '\n'
  --       )
  --       local output_lines = {}
  --       local job_id = vim.fn.jobstart({ 'git', 'check-ignore', '--stdin' }, {
  --         stdout_buffered = true,
  --         on_stdout = function(_, data)
  --           output_lines = data
  --         end,
  --       })
  --
  --       -- command failed to run
  --       if job_id < 1 then
  --         return entries
  --       end
  --
  --       -- send paths via STDIN
  --       vim.fn.chansend(job_id, all_paths)
  --       vim.fn.chanclose(job_id, 'stdin')
  --       vim.fn.jobwait({ job_id })
  --       return require('mini.files').default_sort(vim.tbl_filter(function(entry)
  --         return not vim.tbl_contains(output_lines, entry.path)
  --       end, entries))
  --     end,
  -- },
})
-- require('mini.indentscope').setup({ draw = { animation = require('mini.indentscope').gen_animation.none() } })
require('mini.notify').setup()
require('mini.pick').setup()
-- require('mini.statusline').setup({set_vim_settings = false})
require("mini.starter").setup()
-- require('mini.tabline').setup({
--   format = function(buf_id, label)
--     local suffix = vim.bo[buf_id].modified and '● ' or ''
--     return MiniTabline.default_format(buf_id, label) .. suffix
--   end
-- })
require('mini.visits').setup()
-- require('mini.diff').setup({ view = { style = 'sign' }})
