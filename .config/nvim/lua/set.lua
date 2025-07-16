vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.confirm = true
vim.opt.clipboard = "unnamedplus"
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.showmode = false
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.swapfile = false
vim.opt.termguicolors = true
-- vim.opt.completeopt = 'menu,preview,noinsert'
-- vim.opt.shortmess:append('c')
vim.g.mapleader = " "
vim.g.maplocalleader = ","
vim.opt.fillchars:append({ eob = " " })
-- vim.opt.laststatus = 3
vim.opt.signcolumn = "number"
vim.opt.linebreak = true
vim.opt.updatetime = 50
vim.opt.ignorecase = true

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup("HighlightYank", {})

autocmd("TextYankPost", {
	group = yank_group,
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = 200,
		})
	end,
})
