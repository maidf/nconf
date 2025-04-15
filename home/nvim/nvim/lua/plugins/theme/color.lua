local tokyonight = {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true,
      style = "storm",
      -- light_style = "day",
      styles = {
        sidebars = "transparent",
        -- sidebars = "dark",
        floats = "transparent",
      },
    },
    init = function()
      vim.cmd([[colorscheme tokyonight]])
    end,
  }
  
  return {
    tokyonight
  }