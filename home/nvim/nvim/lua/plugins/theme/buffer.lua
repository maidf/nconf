local bufferline = {
  "akinsho/bufferline.nvim",
  dependencies = 'nvim-tree/nvim-web-devicons',
  event = "VeryLazy",
  keys = {
    { "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
    { "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
    { "<leader>dl", "<Cmd>BufferLineCloseRight<CR>", desc = "Delete Buffers to the Right" },
    { "<leader>dh", "<Cmd>BufferLineCloseLeft<CR>", desc = "Delete Buffers to the Left" },
  },
  opts = {
    options = {
      indicator = {
        -- icon = ' ',
        -- style = 'underline',
        style = 'none',
      },
      -- indicator_icon = " ",
      -- separator_style = { " ", " " },
      hover = {
        enabled = true,
        delay = 100,
        reveal = {'close'}
      },
      offsets = {
        {
          filetype = "neo-tree",
          text = "neotree",
          highlight = "directory",
          text_align = "left",
          separator = true,
        },
      },
    },
  },
  config = function(_, opts)
    require("bufferline").setup(opts)
    vim.api.nvim_create_autocmd({ "BufAdd", "BufDelete" }, {
      callback = function()
        vim.schedule(function()
          pcall(nvim_bufferline)
        end)
      end,
    })
  end,
}

return {
  bufferline
}

