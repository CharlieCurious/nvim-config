vim.g.mapleader = " "

vim.keymap.set("n", "<leader>pv", ":Ex<CR>")

vim.keymap.set("n", "<leader>bd", ":bd<CR>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- paste-ovewrite w/ changing register value
vim.keymap.set("x", "<leader>p", "\"_dP")
