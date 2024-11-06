return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")

    -- Cấu hình conform.nvim với Prettier và các formatter khác
    conform.setup({
      formatters_by_ft = {
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        svelte = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        graphql = { "prettier" },
        liquid = { "prettier" },
        lua = { "stylua" },
      },
      format_on_save = false,
    })

    -- Keymap để format với Prettier
    vim.keymap.set({ "n", "v" }, "<leader>mp", function()
      conform.format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      })
    end, { desc = "Format file or range (in visual mode)" })

    -- Cấu hình indentation với 4 spaces
    vim.opt.tabstop = 4      -- Đặt số lượng spaces cho mỗi tab
    vim.opt.shiftwidth = 4   -- Đặt số spaces cho mỗi level indent
    vim.opt.expandtab = true -- Dùng spaces thay vì tabs
    vim.opt.autoindent = true -- Tự động indent khi gõ

    -- Autocommand để thiết lập khi mở các file kiểu JavaScript, TypeScript, HTML, v.v.
    vim.cmd([[
      autocmd FileType javascript,typescript,javascriptreact,typescriptreact,svelte,css,html,json,yaml,markdown,graphql,liquid
      \ setlocal tabstop=4 shiftwidth=4 expandtab
    ]])

    -- Prettier: Đảm bảo tabWidth là 4
    vim.cmd([[
      augroup SetPrettierTabWidth
        autocmd!
        autocmd FileType javascript,typescript,javascriptreact,typescriptreact,svelte,css,html,json,yaml,markdown,graphql,liquid
        \ let b:conform_prettier_options = '--tab-width 4'
      augroup END
    ]])

    -- Nếu format không thành công, in ra thông báo
    vim.cmd([[autocmd User ConformFormatterFailed echo "Formatting failed, please check your setup"]])
  end,
}
