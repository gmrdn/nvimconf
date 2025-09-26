return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "saghen/blink.cmp",
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
    },
    config = function()
        require("mason").setup({ })
        require("mason-lspconfig").setup()
        local status, nvim_lsp = pcall(require, "lspconfig")
        if not status then
            return
        end

        nvim_lsp.eslint.setup({
            on_attach = function(client, bufnr)
                vim.api.nvim_create_autocmd("BufWritePre", {
                    buffer = bufnr,
                    command = "EslintFixAll",
                })
            end,
            settings = {
                workingDirectory = {
                    mode = "location",
                },
            },
            root_dir = nvim_lsp.util.find_git_ancestor,
            capabilities = capabilities,
        })

        vim.diagnostic.config({
            underline = true,
            update_in_insert = false,
            virtual_text = {
                spacing = 4,
                source = "if_many",
                prefix = "●",
            },
            severity_sort = true,
            signs = {
                text = {
                    [vim.diagnostic.severity.ERROR] = " ",
                    [vim.diagnostic.severity.WARN] = " ",
                    [vim.diagnostic.severity.INFO] = " ",
                    [vim.diagnostic.severity.HINT] = " ",
                },
            },
        })
    end,
}
