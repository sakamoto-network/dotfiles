return {
  "AckslD/nvim-neoclip.lua",
  dependencies = {
    {'kkharji/sqlite.lua', module = 'sqlite'},
    {'nvim-telescope/telescope.nvim'},
  },
  opts = {},
  keys = {
    { "<leader>cb", "<cmd>Telescope neoclip<cr>"}
  }
}
