local cmp = require "cmp"

local function is_inside_string()
    local line = vim.api.nvim_get_current_line()
    local col = vim.api.nvim_win_get_cursor(0)[2]

    local before_cursor = line:sub(1, col)
    local inside_string = false

    local quote_count = 0
    for i = 1, #before_cursor do
        local char = before_cursor:sub(i, i)
        if char == '"' or char == "'" then
            quote_count = quote_count + 1
        end
    end

    if quote_count % 2 == 1 then
        inside_string = true
    end

    return inside_string
end

local function contains_path_indicator()
    local line = vim.api.nvim_get_current_line()
    local col = vim.api.nvim_win_get_cursor(0)[2]
    local before_cursor = line:sub(1, col)

    return before_cursor:match("[/%.]") ~= nil
end

cmp.setup {
    completion = {
        autocomplete = { require("cmp.types").cmp.TriggerEvent.TextChanged },
        delay = 100,
        completeopt = "menu,menuone,noselect",
    },
    mapping = {
        ["<CR>"] = cmp.mapping.confirm { select = true },
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.confirm { select = true }
            else
                fallback()
            end
        end, { "i", "s" }),

        ["<Down>"] = cmp.mapping.select_next_item(),
        ["<Up>"] = cmp.mapping.select_prev_item(),
    },
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },
    sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path", trigger_characters = { "/", "./" } },
    },
    -- experimental = {
    --     ghost_text = true,
    -- },
    preselect = cmp.PreselectMode.Item,
    enabled = function()
        if is_inside_string() then
            if contains_path_indicator() then
                return true
            else
                return false
            end
        else
            return true
        end
    end,

}

