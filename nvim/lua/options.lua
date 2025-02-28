require "nvchad.options"

local o = vim.o
o.cursorlineopt = 'both'      -- to enable cursorline!
vim.opt.number = true         -- Enable line numbers
vim.opt.relativenumber = true -- Relative line numbers
vim.opt.numberwidth = 2       -- Set the width for line numbers
vim.opt.signcolumn = "yes"    -- Always show the sign column (e.g., for git signs)
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.textwidth = 80 -- Hard wrap lines at 80 characters
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.breakindent = true
vim.opt.showbreak = "↪ "
vim.opt.colorcolumn = "80"
vim.opt.expandtab = true
