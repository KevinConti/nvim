return {
	"folke/tokyonight.nvim", -- set the gui color of lazy so it's not an ugly pink
	opts = { style = "storm" },
	priority = 1000, -- Run this plugin before others  
	config = function()
		-- load the colorscheme
		vim.cmd([[colorscheme tokyonight]])
	end,
}

