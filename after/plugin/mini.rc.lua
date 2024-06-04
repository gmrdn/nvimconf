-- require('mini.completion').setup()
require('mini.cursorword').setup()
require('mini.extra').setup()
require('mini.files').setup()
require('mini.indentscope').setup({ draw = { animation = require('mini.indentscope').gen_animation.none() } })
require('mini.notify').setup()
require('mini.pick').setup()
-- require('mini.statusline').setup({set_vim_settings = false})
require("mini.starter").setup()
require('mini.tabline').setup({
  format = function(buf_id, label)
    local suffix = vim.bo[buf_id].modified and '● ' or ''
    return MiniTabline.default_format(buf_id, label) .. suffix
  end
})
require('mini.visits').setup()
-- require('mini.diff').setup({ view = { style = 'sign' }})
