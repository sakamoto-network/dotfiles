return {
  'echasnovski/mini.nvim', version = 'false',
  config = function()

    require('mini.pairs').setup()
    require('mini.align').setup()
    require('mini.sessions').setup()
    require('mini.starter').setup({silent = true})
    require('mini.splitjoin').setup()
    require('mini.comment').setup()
    require('mini.bufremove').setup()
    require('mini.cursorword').setup()
  end
}
