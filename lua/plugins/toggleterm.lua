local mapKey = require("utils.keyMapper").mapKey

return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		require("toggleterm").setup({
			size = function(term)
				if term.direction == "horizontal" then
					return 15
				elseif term.direction == "vertical" then
					return vim.o.columns * 0.4
				end
			end,
			open_mapping = [[<c-\>]],
			hide_numbers = true,
			autochdir = false,
			shade_terminals = true,
			start_in_insert = true,
			insert_mappings = true,
			terminal_mappings = true,
			persist_size = true,
			persist_mode = true,
			direction = "float", -- "vertical", "horizontal", "tab", "float" 중 선택
			close_on_exit = true,
			shell = vim.o.shell,
			auto_scroll = true,
			float_opts = {
				border = "curved",
				winblend = 0,
			},
			winbar = {
				enabled = false,
				name_formatter = function(term)
					return term.name
				end,
			},
		})

		-- react-native 개발용(metro 서버 전용)
		local newTerm = require("utils.newToggleTerm").newTerm
		mapKey("<leader>yd", function()
			newTerm(5)
		end, "n", { desc = "Toggle Metro Server" })

		-- 터미널 토글 키맵 (숫자 + <c-t>로 여러 터미널 관리)
		mapKey("<c-t>", "<Cmd>exe v:count1 . 'ToggleTerm'<CR>", "n", { desc = "Toggle Terminal" })

		-- 터미널 모드에서 노말 모드로 나가기
		mapKey("jk", [[<C-\><C-n>]], "t", { desc = "Exit terminal mode" })

		-- 터미널 모드에서 탭 이동
		mapKey("<C-h>", [[<C-\><C-n>gT]], "t", { desc = "Previous tab" })
		mapKey("<C-l>", [[<C-\><C-n>gt]], "t", { desc = "Next tab" })
	end,
}
