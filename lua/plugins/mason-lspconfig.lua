return {
    "mason-org/mason-lspconfig.nvim",
    config = function()
        require('mason-lspconfig').setup({
            ensure_installed = {
                'lua_ls',
                'ts_ls',
                'eslint',
                'html',
                'cssls',
                'jsonls',
                'tailwindcss',
                'pyright',
                'bashls',
                'gopls',
                'dockerls',
                'yamlls',
                'graphql',
                'prismals',
            },
            automatic_enable = {
                exclude = {
                    "ts_ls",
                    "eslint",
                }
            }
        })
    end
}
