vim.g.mapleader = " "

vim.keymap.set("n", "<leader>pv", ":Ex<CR>")

vim.keymap.set("n", "<leader>bd", ":bd<CR>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- paste-ovewrite w/ changing register value
vim.keymap.set("x", "<leader>p", "\"_dP")

-- keep the cursor in the same place when jumpint page
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")


-- copy to system clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")

-- delete without copying
vim.keymap.set("n", "<leader>d", "\"_dP")
vim.keymap.set("v", "<leader>d", "\"_dP")

-- split
vim.keymap.set("n", "<leader>sv", ":vsplit | enew<CR>")
vim.keymap.set("n", "<leader>sh", ":belowright split | enew<CR>")

-- Resize splits easily
vim.keymap.set('n', '<leader>+', ':resize +5<CR>')
vim.keymap.set('n', '<leader>-', ':resize -5<CR>')
vim.keymap.set('n', '<leader>>', ':vertical resize +5<CR>')
vim.keymap.set('n', '<leader><', ':vertical resize -5<CR>')


-- open terminal
vim.keymap.set("n", "<C-t>", ":belowright split | terminal<CR>:resize 10<CR>i")

