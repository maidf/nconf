local mason = {
    "williamboman/mason.nvim",
    event = "VeryLazy",
    priority = 800,
    opts = {
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    },
    config = function(_,opts)
      require("mason").setup(opts)
    end,
  }
  
  
  local mason_lsp = {
    "williamboman/mason-lspconfig.nvim",
    event = "VeryLazy",
    priority = 200,
    opts = {
      ensure_installed = {
        "lua_ls",
        "rust_analyzer",
        "volar",
        "sqlls",
        "jsonls",
        "harper_ls",
        "nil_ls",
      },
    },
    config = function(_,opts)
      require("mason-lspconfig").setup(opts)
      require("mason-lspconfig").setup_handlers {
        function(server_name)
          require("lspconfig")[server_name].setup {}
        end,
        ["harper_ls"] = function()
            require("lspconfig").harper_ls.setup {
                filetypes = {
                    "toml",
                    "cmake",
                    "markdown",
                },
            }
        end,
        ["volar"] = function()
          require("lspconfig").volar.setup {
            init_options = {
              vue = {
                hybridMode = false,
              },
            },
            filetypes = {
              "javascript",
              "typescript",
              "javascriptreact",
              "typescriptreact",
              "vue",
            },
          }
        end,
      }
    end,
  }
  
  local lspconfig = {
    "neovim/nvim-lspconfig",
    event = "VeryLazy",
    dependencies = {
      "mason.nvim",
      "mason-lspconfig.nvim",
    },
    opts = {},
    config = function() end,
  }
  
  return {
    mason,
    mason_lsp,
    lspconfig
  }
