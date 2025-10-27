local mapKey = require("utils.keyMapper").mapKey
return {
	{

		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local builtin = require("telescope.builtin")
			mapKey("<leader>ff", builtin.find_files)
			mapKey("<leader>fg", builtin.live_grep)
			mapKey("<leader>fb", builtin.buffers)
			mapKey("<leader>fh", builtin.help_tags)
			-- 프로젝트 전체 오류목록 표시
			mapKey("<leader>dl", "<cmd>Telescope diagnostics<cr>")
			-- 오류 이동
			mapKey("]e", vim.diagnostic.goto_next) -- 다음 오류
			mapKey("[e", vim.diagnostic.goto_prev) -- 이전 오류
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
		config = function()
			require("telescope").load_extension("fzf")
		end,
	},
}
