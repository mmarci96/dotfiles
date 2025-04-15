require "nvchad.options"

-- add yours here!

local o = vim.o
o.cursorlineopt ='both' -- to enable cursorline!
vim.opt.number = true          -- Enable line numbers
vim.opt.relativenumber = true  -- Relative line numbers
vim.opt.numberwidth = 2        -- Set the width for line numbers
vim.opt.signcolumn = "yes"     -- Always show the sign column (e.g., for git signs)
vim.opt.tabstop = 2
vim.opt.shiftwidth = 4
