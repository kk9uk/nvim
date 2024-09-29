local M = {}

M.disabled = {

    n = {
        ["<leader>wK"] = {
            function()
                vim.cmd "WhichKey"
            end,
            "Which-key all keymaps"
        },
        ["<leader>wk"] = {
            function()
                local input = vim.fn.input "WhichKey: "
                vim.cmd("WhichKey " .. input)
            end,
            "Which-key query lookup"
        }
    },

    v = {
        ["<Up>"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', "Move up", opts = { expr = true } },
        ["<Down>"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', "Move down", opts = { expr = true } }
    },

    x = {
        ["j"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', "Move down", opts = { expr = true } },
        ["k"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', "Move up", opts = { expr = true } },
        -- Don't copy the replaced text after pasting in visual mode
        -- https://vim.fandom.com/wiki/Replace_a_word_with_yanked_text#Alternative_mapping_for_paste
        ["p"] = { 'p:let @+=@0<CR>:let @"=@0<CR>', "Dont copy replaced text", opts = { silent = true } }
    }

}

M.general = {

    v = {
        ["J"] = {
            ":m '>+1<CR>gv=gv",
            "Move Down"
        },
        ["K"] = {
            ":m '<-2<CR>gv=gv",
            "Move Up"
        },
        ["<leader>y"] = {
            "\"+y",
            "Yank (system clipboard)"
        }
    }

}

M.dap = {
    plugin = true,
    n = {
        ["<leader>db"] = {
            "<cmd> DapToggleBreakpoint <CR>",
            "Add breakpoint at line"
        },
        ["<leader>dr"] = {
            "<cmd> DapContinue <CR>",
            "Start or continue the debugger"
        }
    }
}

return M
