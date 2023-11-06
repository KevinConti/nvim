return {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons"
	},
	config = function()
		local nvimtree = require("nvim-tree")

		-- recommended settings from nvim-tree documentation
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		-- change color for arrows in tree to light blue
		-- vim.cmd([[ highlight NvimTreeIndentMarker guifg=#3FC5FF ]])

		-- configure nvim-tree
		nvimtree.setup({
			view = {
				width = 60
			}
		})

		-- set keymaps
		vim.keymap.set("n", "<leader>tf", "<cmd>NvimTreeToggle<CR>", { desc = "[T]oggle [F]ile explorer" })
		vim.keymap.set("n", "<leader>ttf", "<cmd>NvimTreeFindFile<CR>", { desc = "[T]ree - [T]his [F]ile" })
	end
}
