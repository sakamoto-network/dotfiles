local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
vim.opt.rtp:prepend(lazypath)

require "set"
require("lazy").setup({
  spec = {
    {
      'kosayoda/nvim-lightbulb',
      -- 'tpope/vim-fugitive',
      -- {'ggandor/leap.nvim', config = function() require('leap').create_default_mappings() end},
      {
        'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
        config = function() 
          require("lsp_lines").setup()
          vim.diagnostic.config({ virtual_text = false, })
        end
      },
      -- {"shortcuts/no-neck-pain.nvim", version = "*"},
      { import = 'plugins' },
    },
  },
})
require "keymaps"
