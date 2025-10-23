local mapKey = require("utils.keyMapper").mapKey

local newTerm = function(count)
	local Terminal = require("toggleterm.terminal").Terminal
	local opts = { buffer = 0 }
	local new_term = Terminal:new({
		count = count,
		direction = "float",
		on_open = function(term)
			mapKey("<esc>", function()
				term:toggle()
			end, "t", opts)
		end,
	})
	new_term:toggle()
end

return { newTerm = newTerm }
