-- n, v, i, t = mode names

local M = {}

M.general = {

    n = {
        -- switch between windows
        ["<C-h>"] = { "<C-w>h", "Window left" },
        ["<C-l>"] = { "<C-w>l", "Window right" },
        ["<C-j>"] = { "<C-w>j", "Window down" },
        ["<C-k>"] = { "<C-w>k", "Window up" },

        ["<leader>ch"] = { "<cmd> NvCheatsheet <CR>", "Mapping cheatsheet" },

        ["<leader>fm"] = {
            function()
                vim.lsp.buf.format { async = true }
            end,
            "LSP formatting",
        }
    },

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

M.tabufline = {
    plugin = true,

    n = {
        -- cycle through buffers
        ["<tab>"] = {
            function()
                require("nvchad.tabufline").tabuflineNext()
            end,
            "Goto next buffer",
        },

        ["<S-tab>"] = {
            function()
                require("nvchad.tabufline").tabuflinePrev()
            end,
            "Goto prev buffer",
        },

        -- close buffer + hide terminal buffer
        ["<leader>x"] = {
            function()
                require("nvchad.tabufline").close_buffer()
            end,
            "Close buffer",
        },
    },
}

M.comment = {
    plugin = true,

    v = {
        ["<C-_>"] = {
            "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
            "Toggle comment",
        },
    }
}

M.lspconfig = {
    plugin = true,

    -- See `<cmd> :help vim.lsp.*` for documentation on any of the below functions

    n = {

        ["gd"] = {
            function()
                vim.lsp.buf.definition()
            end,
            "LSP definition",
        },

        ["K"] = {
            function()
                vim.lsp.buf.hover()
            end,
            "LSP hover",
        },

        ["gi"] = {
            function()
                vim.lsp.buf.implementation()
            end,
            "LSP implementation",
        },

        ["<leader>rn"] = {
            function()
                require("nvchad.renamer").open()
            end,
            "LSP rename",
        },

        ["<leader>vca"] = {
            function()
                vim.lsp.buf.code_action()
            end,
            "LSP code action",
        },

        ["gr"] = {
            function()
                vim.lsp.buf.references()
            end,
            "LSP references",
        },

        ["[d"] = {
            function()
                vim.diagnostic.goto_prev { float = { border = "rounded" } }
            end,
            "Goto prev",
        },

        ["]d"] = {
            function()
                vim.diagnostic.goto_next { float = { border = "rounded" } }
            end,
            "Goto next",
        },

        ["<leader>d"] = {
            function()
                vim.diagnostic.setloclist()
            end,
            "Diagnostic setloclist",
        },

        ["<leader>wsa"] = {
            function()
                vim.lsp.buf.add_workspace_folder()
            end,
            "Add workspace folder",
        },

        ["<leader>wsr"] = {
            function()
                vim.lsp.buf.remove_workspace_folder()
            end,
            "Remove workspace folder",
        },

        ["<leader>wsl"] = {
            function()
                print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
            end,
            "List workspace folders",
        },
    }

}

M.nvimtree = {
    plugin = true,

    n = {
        -- toggle
        ["<C-n>"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree" },

        -- focus
        ["<leader>e"] = { "<cmd> NvimTreeFocus <CR>", "Focus nvimtree" },
    },
}

M.telescope = {
    plugin = true,

    n = {
        -- find
        ["<leader>ff"] = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "Find files" },
        ["<leader>rg"] = { "<cmd> Telescope live_grep <CR>", "Live grep" },
        ["<leader>fr"] = { "<cmd> Telescope oldfiles <CR>", "Find recent files" },
        ["<leader>fw"] = { "<cmd> Telescope current_buffer_fuzzy_find <CR>", "Find in current buffer" },

        -- git
        ["<leader>g#"] = { "<cmd> Telescope git_commits <CR>", "Git commits" },
        ["<leader>g?"] = { "<cmd> Telescope git_status <CR>", "Git status" },

    },
}

M.gitsigns = {
    plugin = true,

    n = {
        -- Navigation through hunks
        ["]c"] = {
            function()
                if vim.wo.diff then
                    return "]c"
                end
                vim.schedule(function()
                    require("gitsigns").next_hunk()
                    require("gitsigns").preview_hunk()
                end)
                return "<Ignore>"
            end,
            "Jump to next hunk",
            opts = { expr = true },
        },

        ["[c"] = {
            function()
                if vim.wo.diff then
                    return "[c"
                end
                vim.schedule(function()
                    require("gitsigns").prev_hunk()
                    require("gitsigns").preview_hunk()
                end)
                return "<Ignore>"
            end,
            "Jump to prev hunk",
            opts = { expr = true },
        },

        -- Actions
        ["<leader>gr"] = {
            function()
                require("gitsigns").reset_hunk()
            end,
            "Reset hunk",
        },

        ["<leader>gb"] = {
            function()
                package.loaded.gitsigns.blame_line()
            end,
            "Blame line",
        }

    },
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

M.context = {
    plugin = true,

    n = {
        ["<leader>c"] = {
            function()
                require("treesitter-context").go_to_context(vim.v.count1)
            end,
            "Jump to context"
        }
    }
}

return M
