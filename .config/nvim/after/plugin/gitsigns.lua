require('gitsigns').setup()

vim.keymap.set('n', '<leader>gp', ':Gitsigns preview_hunk<CR>', {})
vim.keymap.set('n', '<leader>gi', ':Gitsigns preview_hunk_inline<CR>', {})
