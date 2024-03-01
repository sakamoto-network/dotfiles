return {
  'renerocksai/telekasten.nvim',
  dependencies = {'nvim-telescope/telescope.nvim', "nvim-lua/plenary.nvim"},
  keys = {
    {"<leader>z", "<cmd>Telekasten panel<cr>"}
  },
  opts = {
    home = vim.fn.expand("~/zettelkasten"), -- Put the name of your notes directory here
    template_new_note = '~/zettelkasten/templates/note.md',
  }
}
