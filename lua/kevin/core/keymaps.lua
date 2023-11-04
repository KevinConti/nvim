vim.g.mapleader = " "

vim.keymap.set({'n'}, '<C-d>', '<C-d>zz')
vim.keymap.set({'n'}, '<C-u>', '<C-u>zz')

-- imitate alt + up / alt + down behavior for dragging lines of text
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

-- concat previous lines
vim.keymap.set("n", "J", "mzJ`z")


