local tree = {
  "nvim-neo-tree/neo-tree.nvim",
  lazy = true,
  event = "VeryLazy",
  keys = {
    {
      "<leader>fe",
      function()
        require("neo-tree.command").execute({ toggle = true, dir = vim.uv.cwd() })
      end,
      desc = "打开当前目录目录树",
    },
    { "<leader>e", "<leader>fe", remap = true },
  },
  opts = {
    sources = { "filesystem", "buffers", "git_status" },
    filesystem = {
      filtered_items = {
        visible = true,
        show_hidden_count = true,
        hide_dotfiles = false,
        hide_by_name = {
          '.git',
        },
      },
    },
    open_files_do_not_replace_types = { "terminal", "Trouble", "trouble", "qf", "Outline" },
    -- commands = {
    --   image_wezterm = function(state)
    --     local node = state.tree:get_node()
    --     if node.type == "file" then
    --       require("image_preview").PreviewImage(node.path)
    --     end
    --   end
    -- },
    window = {
      width = 30,
      mappings = {
        ["<space>"] = "none",
        ["<tab>"] = "open",
        ["<2-LeftMouse>"] = "open",
        ["<leader>sv"] = "open_vsplit",
        ["s"] = "open_vsplit",
        ["h"] = "open_split",
        ["<leader>sh"] = "open_split",
        ["<leader>c"] = "close_node",
        ["A"] = "add_directory",
        ["a"] = {
          "add",
          config = {
            show_path = "relative"
          }
        },
        ["d"] = "delete",
        ["r"] = "rename",
        -- ["y"] = "copy_to_clipboard",
        -- ["p"] = "paste_from_clipboard",
        ["c"] = {
          "copy",
          config = {
            show_path = "relative" -- "none", "relative", "absolute"
          }
        },
        ["m"] = {
          "move",
          config = {
            show_path = "relative" -- "none", "relative", "absolute"
          }
        },
        ["y"] = {
          function(state)
            local node = state.tree:get_node()
            local path = node:get_id()
            vim.fn.setreg("+", path, "c")
          end,
          desc = "Copy Path to Clipboard",
        },
        ["o"] = {
          function(state)
            require("lazy.util").open(state.tree:get_node().path, { system = true })
          end,
          desc = "Open with System Application",
        },
        ["p"] = { "toggle_preview", config = { use_float = true, use_image_nvim = false } },
        ["l"] = "focus_preview",
        ["P"] = {
          function(state)
            local node = state.tree:get_node()
            local img = require("image_preview")
            if node.type == "file" then
              img.PreviewImage(node.path)
            end
          end,
          desc = "Preview image",
        },
        ["<leader>p"] = "focus_preview",
        ["i"] = "show_file_details",
      },
    },
    default_component_configs = {
      git_status = {
        symbols = {
          unstaged = "󰄱",
          staged = "󰱒",
        },
      },
      -- symlink_target = { enabled = true, },
    },
  },
  init = function()
    -- FIX: use `autocmd` for lazy-loading neo-tree instead of directly requiring it,
    -- because `cwd` is not set up properly.
    vim.api.nvim_create_autocmd("BufEnter", {
      group = vim.api.nvim_create_augroup("Neotree_start_directory", { clear = true }),
      desc = "Start Neo-tree with directory",
      once = true,
      callback = function()
        if package.loaded["neo-tree"] then
          return
        else
          local stats = vim.uv.fs_stat(vim.fn.argv(0))
          if stats and stats.type == "directory" then
            require("neo-tree")
          end
        end
      end,
    })
  end,
  config = function(_, opts)
    require("neo-tree").setup(opts)
    vim.api.nvim_create_autocmd("TermClose", {
      pattern = "*lazygit",
      callback = function()
        if package.loaded["neo-tree.sources.git_status"] then
          require("neo-tree.sources.git_status").refresh()
        end
      end,
    })
  end,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
  }
}

local imageview = {
  'adelarsq/image_preview.nvim',
  event = 'VeryLazy',
  config = function()
    require("image_preview").setup()
  end
}



return {
  tree,
  imageview
}
