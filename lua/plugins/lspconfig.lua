return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "saghen/blink.cmp",
    "williamboman/mason.nvim"
  },
  config = function()
    local status, nvim_lsp = pcall(require, "lspconfig")
    if not status then
        return
    end

    local protocol = require("vim.lsp.protocol")

    local util = require("lspconfig.util")

    -- Use an on_attach function to only map the following keys
    -- after the language server attaches to the current buffer
    local on_attach = function(client, bufnr)
        if client.name == "ts_ls" then
            client.server_capabilities.documentFormattingProvider = false -- 0.8 and later
        end
        local function buf_set_keymap(...)
            vim.api.nvim_buf_set_keymap(bufnr, ...)
        end

        local function buf_set_option(...)
            vim.api.nvim_buf_set_option(bufnr, ...)
        end

        --Enable completion triggered by <c-x><c-o>
        buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

        -- Mappings.
        local opts = { noremap = true, silent = true }
    end


    -- blink capabilities
    local capabilities = require("blink.cmp").get_lsp_capabilities()


    -- nvim_lsp.ts_ls.setup({
    --     root_dir = function(fname)
    --         return util.root_pattern(".git")(fname)
    --     end,
    --     on_attach = on_attach,
    --     filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
    --     cmd = { "typescript-language-server", "--stdio" },
    --     capabilities = capabilities,
    --     init_options = {
    --         preferences = {
    --             importModuleSpecifierPreference = "relative",
    --         },
    --     },
    -- })

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

    nvim_lsp.volar.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        filetypes = { "vue", "typescript", "javascript", "javascriptreact", "typescriptreact" },
        init_options = {
            typescript = {
                serverPath = "node_modules/typescript/lib/tsserver.js",
            },
        },
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

  end
}
