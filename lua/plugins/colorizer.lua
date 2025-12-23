return {
	"norcalli/nvim-colorizer.lua",
	config = function()
		require("colorizer").setup({
			"*",
		}, {
			RRGGBBAA = true, -- #RRGGBBAA 형식 활성화
		})
	end,
}
