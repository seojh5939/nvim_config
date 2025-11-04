local keyMapper = require("utils.keyMapper").mapKey

return {
	{
		"mason-org/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			"mason-org/mason.nvim",
			"neovim/nvim-lspconfig",
			"hrsh7th/nvim-cmp",
		},
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "ts_ls", "kotlin_language_server" },
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			-- nvim-cmp capabilities 설정
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			-- 진단 설정
			vim.diagnostic.config({
				virtual_text = true, -- 코드 옆에 에러/경고 표시
				signs = true, -- 왼쪽 sign column에 표시
				underline = true, -- 코드에 밑줄 표시
				update_in_insert = false, -- insert 모드에서는 업데이트 안함
				severity_sort = true, -- 심각도 순으로 정렬
			})

			-- Completion 트리거 문자 개선
			capabilities.textDocument.completion.completionItem.snippetSupport = true
			capabilities.textDocument.completion.completionItem.resolveSupport = {
				properties = {
					"documentation",
					"detail",
					"additionalTextEdits",
				},
			}

			-- TypeScript/JavaScript (auto-import 활성화)
			vim.lsp.config("ts_ls", {
				cmd = { "typescript-language-server", "--stdio" },
				filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
				root_markers = { "package.json", "tsconfig.json", "jsconfig.json", ".git" },
				capabilities = capabilities,
				settings = {
					typescript = {
						inlayHints = {
							includeInlayParameterNameHints = "all",
							includeInlayFunctionParameterTypeHints = true,
						},
						suggest = {
							includeCompletionsForModuleExports = true,
							includeAutomaticOptionalChainCompletions = true,
						},
						preferences = {
							includeCompletionsForImportStatements = true,
							includeCompletionsWithInsertText = true,
						},
					},
					javascript = {
						suggest = {
							includeCompletionsForModuleExports = true,
							includeAutomaticOptionalChainCompletions = true,
						},
						preferences = {
							includeCompletionsForImportStatements = true,
							includeCompletionsWithInsertText = true,
						},
					},
				},
			})
			-- Lua
			vim.lsp.config("lua_ls", {
				cmd = { "lua-language-server" },
				filetypes = { "lua" },
				root_markers = { ".luarc.json", ".git" },
				capabilities = capabilities,
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
					},
				},
			})

			-- Kotlin
			vim.lsp.config("kotlin_language_server", {
				cmd = { "kotlin-language-server" },
				filetypes = { "kotlin" },
				root_markers = { "settings.gradle", ".git" },
				capabilities = capabilities,
			})

			-- Swift (시스템 설치 필요)
			vim.lsp.config("sourcekit", {
				cmd = { "sourcekit-lsp" },
				filetypes = { "swift", "objective-c", "objective-cpp" },
				root_markers = { "Package.swift", ".git" },
				capabilities = capabilities,
			})

			-- LSP 서버 활성화
			vim.lsp.enable("ts_ls")
			vim.lsp.enable("lua_ls")
			vim.lsp.enable("kotlin_language_server")
			vim.lsp.enable("sourcekit")

			-- 키맵핑
			keyMapper("K", vim.lsp.buf.hover)
			keyMapper("gd", vim.lsp.buf.definition)
			keyMapper("<leader>ca", vim.lsp.buf.code_action)
		end,
	},
}
