return {
	"neovim/nvim-lspconfig",
	config = function()
		-- auto format
		vim.cmd([[autocmd BufWritePre * lua vim.lsp.buf.format()]])

		-- Setup language servers.
		local lspconfig = require("lspconfig")

		-- Enable (broadcasting) snippet capability for completion
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities.textDocument.completion.completionItem.snippetSupport = true

		lspconfig.ts_ls.setup({})
		-- lspconfig.clangd.setup {}
		-- lspconfig.clangd.setup({
		--   cmd = {'clangd', '--background-index', '--clang-tidy', '--log=verbose'},
		--   init_options = {
		--     fallbackFlags = { '-std=c++17' },
		--   },
		-- })
		-- lspconfig.rust_analyzer.setup {
		--   capabilities = capabilities,
		-- }
		lspconfig.marksman.setup({})
		require("lspconfig").cssls.setup({
			capabilities = capabilities,
		})
		require("lspconfig").html.setup({
			capabilities = capabilities,
		})
		require("lspconfig").emmet_ls.setup({})
		require("lspconfig").clangd.setup({})

		-- Global mappings.
		-- See `:help vim.diagnostic.*` for documentation on any of the below functions
		vim.keymap.set("n", "<leader>gm", vim.diagnostic.open_float)
		vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
		vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
		vim.keymap.set("n", "<leader>q", vim.diagnostic.setqflist)

		-- Use LspAttach autocommand to only map the following keys
		-- after the language server attaches to the current buffer
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				-- Enable completion triggered by <c-x><c-o>
				-- vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
				-- Buffer local mappings.
				-- See `:help vim.lsp.*` for documentation on any of the below functions
				local opts = { buffer = ev.buf }
				vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
				vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
				vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
				vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
				vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
				vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
				vim.keymap.set("n", "<leader>wl", function()
					print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
				end, opts)
				vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
				vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
				vim.keymap.set("n", "<A-CR>", vim.lsp.buf.code_action, opts)
				vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
				vim.keymap.set("n", "<leader>f", function()
					vim.lsp.buf.format({ async = true })
				end, opts)
			end,
			vim.keymap.set("n", "<leader>i", function()
				vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ 0 }), { 0 })
			end, opts),
		})

		vim.diagnostic.config({
			-- Use the default configuration
			virtual_lines = true,

			-- Alternatively, customize specific options
			virtual_lines = {
				-- Only show virtual line diagnostics for the current cursor line
				current_line = true,
			},
		})
	end,
}
