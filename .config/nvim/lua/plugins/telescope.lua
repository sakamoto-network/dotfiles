return {
  'nvim-telescope/telescope.nvim', 
  tag = '0.1.8',
  dependencies = {
    'debugloop/telescope-undo.nvim',
  },
  keys = {
    {"<leader><leader>", "<cmd>Telescope find_files<cr>"},
    {"<leader>ts", "<cmd>Telescope<cr>"},
    {"<leader>b", "<cmd>Telescope buffers<cr>"},
  },
  opts = function()
    require("telescope").setup {
      defaults = {
        theme = "center",
        entry_prefix = "  ",
        prompt_prefix = "   ",
        selection_caret = "  ",
        color_devicons = true,
        file_ignore_patterns = { 
          "node_modules",
          ".git",
          ".idea",
          ".vscode"
        },

        sorting_strategy = "ascending",
        layout_strategy = "flex",
        layout_config = {
          horizontal = {
            prompt_position = "top",
            preview_width = 0.55,
          },
        },
        vertical = { mirror = false },
        width = 0.87,
        height = 0.80,
        preview_cutoff = 50,
        border = {},
        borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
      },
      pickers = {
        buffers = {
          show_all_buffers = true,
          theme = "dropdown",
          sort_mru = true,
          previewer = false,
        },
        find_files = {
          hidden = true,
          -- theme = "dropdown",
          -- previewer = false,
        }
      },
      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown {}
        },
      }
    }
  end
}
