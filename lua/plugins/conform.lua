return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
      format_on_save = {
        timeout_ms = 3000,
        lsp_fallback = true,
      },
			formatters_by_ft = {
				lua = { "stylua" },
				go = { "goimports", "gofumpt" },
				python = { "ruff_organize_imports", "ruff_format" },
			},
		})
		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = "*",
			callback = function(args)
				require("conform").format({ bufnr = args.buf })
			end,
		})
	end,
}
