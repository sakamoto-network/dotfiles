return {  
  'ThePrimeagen/harpoon', branch = 'harpoon2',
  dependencies = { {"nvim-lua/plenary.nvim"} },
  opts = function()
    local harpoon = require("harpoon")

    -- REQUIRED
    harpoon:setup()
    -- REQUIRED

    vim.keymap.set("n", "<leader>a", function() harpoon:list():append()  vim.notify("Marked!") end)
    vim.keymap.set("n", "<C-p>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
  end
}
