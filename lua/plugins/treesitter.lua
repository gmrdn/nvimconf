return {
    "nvim-treesitter/nvim-treesitter",
    version = false, -- last release is way too old and doesn't work on Windows
    build = ":TSUpdate",

    config = function()
        require("nvim-treesitter.configs").setup({
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
        })
    end,
}
