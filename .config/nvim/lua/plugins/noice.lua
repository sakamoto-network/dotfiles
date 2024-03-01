return {
  'folke/noice.nvim', 
  dependencies = {'MunifTanjim/nui.nvim'},
  event = "BufReadPost",
  opts = {
    lsp = {
      progress = {
        enabled = false,
      },
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
      },
    },
    presets = {
      bottom_search = true,
      command_palette = true,
      long_message_to_split = false,
      inc_rename = true,
    },
  },
}
