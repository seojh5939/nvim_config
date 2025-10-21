return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = {
		{ "windwp/nvim-ts-autotag" },
	},
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			ensure_installed = { "lua", "javascript", "html", "typescript", "kotlin", "tsx" },
			sync_install = false,
			highlight = { enable = true },
			indent = { enable = true },
			autotag = { enable = true },
		})

		-- nvim-ts-autotag 별도 설정 추가
		require("nvim-ts-autotag").setup({
			opts = {
				enable_close = true, -- 자동 닫기 태그
				enable_rename = true, -- 태그 이름 변경 시 쌍으로 변경
				enable_close_on_slash = true, -- /> 입력 시 자동 완성
			},
		})
	end,
}
