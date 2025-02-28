-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
    theme = "rosepine",
    transparency = true,
    tabufline = {
        enabled = true,
        lazyload = true,
        order = { "treeOffset", "buffers", "tabs", "btns" },
        modules = nil,
        bufwidth = 21,
    },

    hl_override = {
        -- Comment = { italic = true },
        -- ["@comment"] = { italic = true },
        Function = { italic = true },
        ["@function"] = { italic = true },
        -- Make arrow functions italic (TS queries)
        ["@function.call"] = { italic = true },
        ["@function.builtin"] = { italic = true },
        ["@function.macro"] = { italic = true },

        -- Make parameters & properties italic
        -- ["@parameter"] = { italic = true },
        -- ["@property"] = { italic = true },
        -- ["@variable.parameter"] = { italic = true },

        -- Make keyword-like function (like 'const' in JS) italic
        ["@keyword.function"] = { italic = true },
    },
}

return M
