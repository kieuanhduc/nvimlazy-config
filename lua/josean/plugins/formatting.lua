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
				scss = { "prettier" }, -- Thêm cấu hình cho SCSS
				html = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier" },
				liquid = { "prettier" },
				lua = { "stylua" },
			},
			formatters = {
				prettier = {
					prepend_args = { "--use-tabs", "--tab-width", "4" },
				},
			},
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
		vim.opt.tabstop = 4 -- Đặt số lượng spaces cho mỗi tab
		vim.opt.shiftwidth = 4 -- Đặt số spaces cho mỗi level indent
		vim.opt.expandtab = false -- Dùng spaces thay vì tabs
		vim.opt.autoindent = true -- Tự động indent khi gõ
	end,
}

