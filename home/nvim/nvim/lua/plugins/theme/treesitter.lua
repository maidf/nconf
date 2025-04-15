local treesitter = {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = "VeryLazy",
  lazy = vim.fn.argc(-1) == 0, -- load treesitter early when opening a file from the cmdline
  init = function(plugin)
    require("lazy.core.loader").add_to_rtp(plugin)
    require("nvim-treesitter.query_predicates")
  end,
  cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
  keys = {
    { "<leader>vi", desc = "Increment Selection" },
    { "<bs>",       desc = "Decrement Selection", mode = "x" },
  },
  opts_extend = { "ensure_installed" },
  opts = {
    highlight = { enable = true },
    indent = { enable = true },
    -- rainbow = {
    --   enable = true,
    --   extended_mode = true,
    --   max_file_lines = nil,
    -- },
    ensure_installed = {
      "bash",
      "vim",
      "rust",
      "fish",
      "wgsl_bevy",
      "java",
      "sql",
      "regex",
      "vue",
      "html",
      "css",
      "scss",
      "javascript",
      "typescript",
      "json",
      "xml",
      "yaml",
      "toml",
      "ssh_config",
      "nix",
      "lua",
      "gitignore"
    },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<leader>vi",
        node_incremental = "<leader>vi",
        scope_incremental = false,
        node_decremental = "<bs>",
      },
    },
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,
}


local rainbow = {
  "HiPhish/rainbow-delimiters.nvim",
  event = "VeryLazy",
  opts = {},
  config = function()
    require('rainbow-delimiters.setup').setup()
  end,
}


return {
  treesitter,
  rainbow
}
