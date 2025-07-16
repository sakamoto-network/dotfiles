-- nnoremap("<C-Left>", "<C-w>h")
-- nnoremap("<C-Down>", "<C-w>j")
-- nnoremap("<C-Up>", "<C-w>k")
-- nnoremap("<C-Right>", "<C-w>l")

-- tnoremap("<leader><esc>", "<C-\\><C-n>")

vim.keymap.set("n", "<C-d>", "<C-d>zz", { silent = true })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { silent = true })

vim.keymap.set("n", "<leader>-", "<cmd>vsp<CR>", { silent = true })
vim.keymap.set("n", "<leader>'", "<cmd>sp<CR>", { silent = true })
