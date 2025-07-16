return {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	keys = {
		{ "<leader><leader>", "<cmd>FzfLua files<cr>" },
		{ "<tab>", "<cmd>FzfLua buffers<cr>" },
		{ "<c-f>", "<cmd>FzfLua live_grep<cr>" },
	},
	config = function()
		require("fzf-lua").register_ui_select()
	end,
}
