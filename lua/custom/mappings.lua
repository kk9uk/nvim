local M = {}

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
