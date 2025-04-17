-- Show line numbers
vim.opt.nu = true
-- Show relative line numbers (current line is 0, others are relative to it)
vim.opt.relativenumber = true

-- Convert tabs to spaces
vim.opt.expandtab = true
-- Set the number of spaces that a <Tab> counts for while editing
vim.opt.tabstop = 4
-- Set the number of spaces that a <Tab> counts for while editing in insert mode
vim.opt.softtabstop = 4

-- Set the number of spaces to use for each step of (auto)indent
vim.opt.shiftwidth = 4
-- Enable smart indentation based on the context
vim.opt.smartindent = true
-- Disable line wrapping
vim.opt.wrap = false

-- Disable creating a swap file (temporary file while editing)
vim.opt.swapfile = false
-- Disable creating backup files (previous versions of files)
vim.opt.backup = false

-- Enable persistent undo (undo history saved even after closing the file)
vim.opt.undofile = true
-- Set the undo directory to store undo history
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

-- Disable highlighting of search results
vim.opt.hlsearch = false
-- Enable incremental search (shows matches as you type)
vim.opt.incsearch = true

-- Set the time in milliseconds to wait before triggering the 'updatetime' event
vim.opt.updatetime = 50

-- Yank (copy) the selected text into the system clipboard
vim.opt.clipboard = ""
vim.cmd([[
    let g:clipboard = {
                \   'name': 'WslClipboard',
                \   'copy': {
                \      '+': 'clip.exe',
                \      '*': 'clip.exe',
                \    },
                \   'paste': {
                \      '+': 'powershell.exe -NoLogo -NoProfile -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
                \      '*': 'powershell.exe -NoLogo -NoProfile -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
                \   },
                \   'cache_enabled': 0,
                \ }
]])
