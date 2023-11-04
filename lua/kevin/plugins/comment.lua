return {
	"numToStr/Comment.nvim",
	event = { "BufReadPre", "BufNewFile" }, -- load on buffer
	config = true, -- equiv. to require('Comment').setup(),
	mappings = {
		basic = true, -- gcc, gbc, gc{motion}, gb{motion},
		extra = true -- gco, gc0, gcA
	}
}
