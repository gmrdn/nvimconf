return {
    "nvim-treesitter/nvim-treesitter", 
    branch = 'master', 
    lazy = false, 
    build = ":TSUpdate",
    opts = {
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
        },
        ensure_installed = {
            "bash",
            "css",
            "dockerfile",
            "go",
            "html",
            "javascript",
            "json",
            "lua",
            "markdown",
            "python",
            "rust",
            "toml",
            "typescript",
            "vim",
            "vue",
            "yaml"
        },
    },
}

