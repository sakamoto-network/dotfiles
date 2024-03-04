local M = {}

function bind(op, outer_opts)
    outer_opts = outer_opts or {noremap = true}
    return function(lhs, rhs, opts)
        opts = vim.tbl_extend("force",
            outer_opts,
            opts or {}
        )
        vim.keymap.set(op, lhs, rhs, opts)
    end
end

M.nmap = bind("n", {noremap = false})
M.nnoremap = bind("n")
M.vnoremap = bind("v")
M.xnoremap = bind("x")
M.inoremap = bind("i")
M.tnoremap = bind("t")

-- thanks https://github.com/ThePrimeagen/

local nnoremap = M.nnoremap
local vnoremap = M.vnoremap
local inoremap = M.inoremap
local xnoremap = M.xnoremap
local tnoremap = M.tnoremap
local nmap = M.nmap
local silent = { silent = true }

-- keymaps go here

-- nnoremap("<C-Left>", "<C-w>h")
-- nnoremap("<C-Down>", "<C-w>j")
-- nnoremap("<C-Up>", "<C-w>k")
-- nnoremap("<C-Right>", "<C-w>l")

tnoremap("<leader><esc>", "<C-\\><C-n>")

nnoremap("<C-d>", "<C-d>zz")
nnoremap("<C-u>", "<C-u>zz")

nnoremap("<leader>-", "<cmd>vsp<cr>")
nnoremap("<leader>'", "<cmd>sp<cr>")
nnoremap("<esc><esc>", "<cmd>noh<cr>")
return M
