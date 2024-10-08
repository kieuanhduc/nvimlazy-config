return {
    "akinsho/toggleterm.nvim",
    config = function()
        require("toggleterm").setup {
            size = 20,
            open_mapping = [[tt]],  -- Sử dụng tổ hợp phím hợp lệ
            hide_numbers = true,
            shade_filetypes = {},
            shade_terminals = true,
            shading_factor = 2,  -- Sử dụng số thay vì chuỗi
            start_in_insert = true,
            insert_mappings = true,
            persist_size = true,
            direction = 'float',  -- Sử dụng floating window
            close_on_exit = true,
            shell = vim.o.shell,
            float_opts = {
                border = 'curved',
                width = 200,
                height = 50,
                winblend = 3,
                highlights = {
                    border = "Normal",
                    background = "Normal",
                }
            }
        }
    end
}