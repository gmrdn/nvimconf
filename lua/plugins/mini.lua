return {
    "echasnovski/mini.nvim",
    version = false,
    config = function()
        require('mini.cursorword').setup()
        require('mini.extra').setup()
        require('mini.files').setup()
        require('mini.pick').setup()
        require('mini.sessions').setup()
        require('mini.visits').setup()
    end
}
