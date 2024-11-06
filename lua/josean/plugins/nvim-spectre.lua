return {
    "nvim-pack/nvim-spectre",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("spectre").setup({
        -- Cấu hình để bỏ qua các thư mục vendor và node_modules
        ignore_dirs = { "vendor", "node_modules" },
        find_engine = {
          -- Cấu hình ripgrep để bỏ qua các thư mục không mong muốn
          ["rg"] = {
            cmd = "rg",
            args = {
              "--color=never",
              "--no-heading",
              "--with-filename",
              "--line-number",
              "--column",
              "--smart-case",
              "--hidden",
              "--glob=!.git/",
              "--glob=!node_modules/",
              "--glob=!vendor/",
            },
            options = {
              ["ignore-case"] = {
                value = "--ignore-case",
                icon = "[I]",
                desc = "ignore case",
              },
              ["hidden"] = {
                value = "--hidden",
                desc = "hidden file",
                icon = "[H]",
              },
            },
          },
        },
      })
  
      -- Spectre keymaps
      local keymap = vim.keymap -- for conciseness
  
      keymap.set("n", "<leader>sr", "<cmd>lua require('spectre').open()<CR>", { desc = "Replace in files (Spectre)" })
      keymap.set("n", "<leader>sw", "<cmd>lua require('spectre').open_visual({select_word=true})<CR>", { desc = "Search current word (Spectre)" })
      keymap.set("v", "<leader>sw", "<esc><cmd>lua require('spectre').open_visual()<CR>", { desc = "Search current word (Spectre)" })
      keymap.set("n", "<leader>sp", "viw:lua require('spectre').open_file_search()<CR>", { desc = "Search in current file (Spectre)" })
    end,
  }