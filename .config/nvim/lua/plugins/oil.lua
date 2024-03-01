return {
  "stevearc/oil.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
keys = {
  { "<leader>e", "<cmd>Oil<CR>"},
  { "<leader>df", "<cmd>Oil ~/.config/nvim/<CR>"},
},
  opts = {
    win_options = {
      signcolumn = "yes:2",
    },
    view_options = {
      -- Show files and directories that start with "."
      show_hidden = true,
    },
    delete_to_trash = true,
  }
}
