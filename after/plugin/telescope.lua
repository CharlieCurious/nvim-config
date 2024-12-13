local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>fp', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = 'Telescope find git tracked files' })

-- Show only unsaved buffers
vim.keymap.set('n', '<leader>fb', function()
  builtin.buffers({
    only_modified = true,-- Filter to show only modified (unsaved) buffers
  })
end, { noremap = true, silent = true })

vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' }) -- requires ripgrep: https://github.com/BurntSushi/ripgrep.git


