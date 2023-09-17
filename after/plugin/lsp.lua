local lsp = require("lsp-zero")
lsp.preset("recommended")

lsp.setup()

vim.diagnostic.config({ virtual_text = true })

local lspconfig = require("lspconfig")

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

lspconfig.efm.setup({
	init_options = { documentFormatting = true },
	settings = {
		rootMarkers = { ".git/" },
		languages = {
			lua = { require("efmls-configs.linters.luacheck"), require("efmls-configs.formatters.stylua") },
			go = {
				-- require("efmls-configs.linters.golangci_lint"),
				require("efmls-configs.formatters.gofmt"),
				require("efmls-configs.formatters.goimports"),
				require("efmls-configs.formatters.golines"),
				require("efmls-configs.formatters.eslint"),
				require("efmls-configs.linters.eslint"),
			},
		},
	},
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({ bufnr = bufnr })
				end,
			})
		end
	end,
})

lspconfig.tsserver.setup({
	on_attach = function(client)
		client.resolved_capabilities.document_formatting = false
		client.resolved_capabilities.document_range_formatting = false
	end,
})

lspconfig.gopls.setup({
	on_attach = function(client)
		client.resolved_capabilities.document_formatting = false
		client.resolved_capabilities.document_range_formatting = false
	end,
	cmd = { "gopls" },
	filetypes = { "go", "gomod", "gowork", "tmpl" },
	settings = { gopls = { completeUnimported = true, usePlaceholders = true, analyses = { unusedparams = true } } },
})
