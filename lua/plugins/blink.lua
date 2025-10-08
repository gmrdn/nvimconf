return {
    'saghen/blink.cmp',
    -- optional: provides snippets for the snippet source
    dependencies = { 'rafamadriz/friendly-snippets' },
    version = '1.*',
    opts = {
        appearance = {
            -- use_nvim_cmp_as_default = false,
            nerd_font_variant = 'mono'
        },

        completion = {
            accept = { auto_brackets = { enabled = true } },
            menu = {
                draw = {
                    treesitter = { "lsp" },
                },
            },
            documentation = {
                auto_show = true,
                auto_show_delay_ms = 250,
                treesitter_highlighting = true,
                window = { border = "rounded" },
            },
        },
        -- signature = {
        --     enabled = true,
        -- },
        sources = {
            default = { 'lsp', 'path', 'buffer' },
        },
        cmdline = {
            enabled = false,
        },

        fuzzy = { implementation = "prefer_rust_with_warning" },
        keymap = {
            preset = 'default',
        },
    },
}
