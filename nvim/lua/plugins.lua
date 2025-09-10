return {

  {
    "akinsho/bufferline.nvim",
    requires = "nvim-tree/nvim-web-devicons",
    config = function()
      require("bufferline").setup{
        options = {
          close_command = "bdelete! %d",
          right_mouse_command = "bdelete! %d",
          left_mouse_command = "buffer %d",
          indicator = { icon = '▎', style = 'icon' },
          buffer_close_icon = '',
          modified_icon = '●',
          close_icon = '',
          left_trunc_marker = '',
          right_trunc_marker = '',
          max_name_length = 30,
          max_prefix_length = 15,
          tab_size = 18,
          diagnostics = "nvim_lsp",
        }
      }
    end
  }
}

