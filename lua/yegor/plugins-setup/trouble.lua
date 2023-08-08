-- Trouble.nvim setup
require("trouble").setup({})

-- Keybinding to toggle the trouble window
vim.api.nvim_set_keymap("n", "<leader>rr", "<cmd>TroubleToggle<cr>", { silent = true, noremap = true })
