return {
	"rebelot/kanagawa.nvim",
	priority = 1000,
	lazy = false,
	config = function()
		require("kanagawa").setup({
			theme = "dragon", -- wave, dragon, lotus
		})
		vim.cmd([[colorscheme kanagawa]])
	end,
}
