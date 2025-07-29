return { 
    "akinsho/bufferline.nvim", 
    version = "*", 
    dependencies = "nvim-tree/nvim-web-devicons",
    opts = {
        options = {
        -- style_preset = bufferline.style_preset.minimal,
        -- indicator = {
            --   style = 'none',
            -- },
            max_name_length = 64,
            diagnostics = "nvim_lsp",
            show_buffer_close_icons = false,
            show_buffer_icons=false,
            show_file_icons = false,
            -- diagnostics_indicator = function(count, level, diagnostics_dict, context)
                --   local icon = level:match("error") and " " or " "
                --   return " " .. icon .. count
                -- end
        }
    }   
}
