local telescope = {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {},
  cmd = "Telescope",
  keys = {
    {
      "<leader>ff",
      ":Telescope find_files<cr>",
      desc = "查找当前目录和子目录下的文件",
    },
    {
      "<leader>fg",
      ":Telescope live_grep<cr>",
      desc = "查找当前目录和子目录下所有的文件内容",
    },
    {
      "<leader>fr",
      ":Telescope resume<cr>",
      desc = "打开上次打开的telescope窗口",
    },
    {
      "<leader>fo",
      ":Telescope oldfiles<cr>",
      desc = "查找打开过的文件",
    },
  },
}

return {
  telescope
}
