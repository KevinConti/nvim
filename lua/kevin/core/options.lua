local opt = vim.opt
opt.nu = true -- line numbers
opt.relativenumber = true -- relative line numbers

-- tabs are 4 spaces
local tabSize = 4
opt.tabstop = tabSize
opt.softtabstop = tabSize
opt.shiftwidth = tabSize
opt.expandtab = true -- tabs are spaces

opt.smartindent = true

opt.hlsearch = false 
opt.incsearch = true

opt.termguicolors = true -- better colors

opt.scrolloff = 8
-- opt.colorcolumn = "80"


