local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
vim.opt.rtp:prepend(lazypath)

require "set"
require("lazy").setup({
  spec = {
    {
      'tpope/vim-fugitive',
      {'ggandor/leap.nvim', config = function() require('leap').create_default_mappings() end},
      { 'kosayoda/nvim-lightbulb', opts = {autocmd = {enabled = true}} },
      {
        'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
        config = function() 
          require("lsp_lines").setup()
          vim.diagnostic.config({ virtual_text = false, }) 
        end
      },
      { import = 'plugins' },
    },
  },
})
require "keymaps"
