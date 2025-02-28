local options = {
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "black" },
		typescript = { "prettier" }, -- Add Prettier for TypeScript
		typescriptreact = { "prettier" },
		javascript = { "prettier" },
	},
	formatters = {
		stylua = {
			prepend_args = {
				"--column-width",
				"80",
				"--tab-width",
				"4",
				"--use-tabs",
				"false",
			},
		},
		black = {
			prepend_args = { "--line-length", "80" },
		},
		prettier = {
			prepend_args = {
				"--print-width",
				"80",
				"--tab-width",
				"4",
				"--use-tabs",
				"false",
			},
		},
	},

	format_on_save = {
		-- These options will be passed to conform.format()
		timeout_ms = 500,
		lsp_fallback = true,
	},
}

return options
