local term = {
    "akinsho/toggleterm.nvim",
    opts = {},
    config = function ()
        require("toggleterm").setup{
            open_mapping = [[<leader>tt]],
            insert_mappings = true,
            hide_numbers = false,
            direction = "float",
            float_opts = {
                border = 'curved',
                title_pos = 'left'
            },
            winbar = {
                enabled = true,
                name_formatter = function (term)
                    return term.name
                end
            }
        }
    end,
    keys = {
        {
            "<leader>tt",
            ":ToggleTerm<cr>",
            desc = "open a term"
        },
        {
            "<leader>ts",
            ":TermSelect<cr>",
            desc = "select one term"
        },
        {
            "<leader>ta",
            ":ToggleTermToggleAll<cr>",
            desc = "open all term"
        },
    }
}

return {
    term
}
