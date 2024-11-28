vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup()

vim.api.nvim_set_keymap("n", "<C-h>", ":vimTreeToggle<cr>", {silent = true, noremap = true})
