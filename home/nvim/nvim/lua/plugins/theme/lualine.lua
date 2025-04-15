local lualine = {
  'nvim-lualine/lualine.nvim',
  event = "VeryLazy",
  opts = function()

    local opts = {
      options = {
        globalstatus = true,
        disabled_filetypes = { statusline = { "dashboard", "alpha", "ministarter", "neo-tree" } },
      },
      sections = {
        lualine_x = { 'encoding', 'filetype', { 'fileformat', symbols = { unix = ' ', dos = ' ', mac = ' ' } } },
      },
    }

    return opts
  end,
  config = function(_, opts)
    require('lualine').setup(opts)
  end,
}

return {
  lualine
}

