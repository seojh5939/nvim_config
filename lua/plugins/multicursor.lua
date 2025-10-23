local keyMap = require("utils.keyMapper").mapKey

return {
	"smoka7/multicursors.nvim",
	event = "VeryLazy",
	dependencies = {
		"nvimtools/hydra.nvim",
	},
	cmd = { "MCstart", "MCvisual", "MCclear", "MCpattern", "MCvisualPattern", "MCunderCursor" },
	keys = {
		{
			mode = { "v", "n" },
			"<Leader>m",
			"<cmd>MCstart<cr>",
			desc = "Create a selection for selected text or word under the cursor",
		},
	},
	config = {
		DEBUG_MODE = false,
		create_commands = true, -- create Multicursor user commands
		updatetime = 50, -- selections get updated if this many milliseconds nothing is typed in the insert mode see :help updatetime
		nowait = true, -- see :help :map-nowait
		mode_keys = {
			append = "a",
			change = "c",
			extend = "e",
			insert = "i",
		}, -- set bindings to start these modes
		hint_config = {
			float_opts = {
				border = "none",
			},
			position = "bottom",
		},
		-- accepted values:
		-- -1 true: generate hints
		-- -2 false: don't generate hints
		-- -3 [[multi line string]] provide your own hints
		-- -4 fun(heads: Head[]): string - provide your own hints
		generate_hints = {
			normal = true,
			insert = true,
			extend = true,
			config = {
				-- determines how many columns are used to display the hints. If you leave this option nil, the number of columns will depend on the size of your window.
				column_count = nil,
				-- maximum width of a column.
				max_hint_length = 25,
			},
		},
	},
}
