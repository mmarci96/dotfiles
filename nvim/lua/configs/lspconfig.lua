-- Load defaults from NvChad
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"
local nvlsp = require "nvchad.configs.lspconfig"

-- LSP servers with default config
local servers = { "tailwindcss", "html", "pyright" }

for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
        on_attach = nvlsp.on_attach,
        on_init = nvlsp.on_init,
        capabilities = nvlsp.capabilities,
    }
end

-- Deno LSP setup
lspconfig.denols.setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
    root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
}

-- TypeScript/JavaScript (tsserver) setup
lspconfig.ts_ls.setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
    root_dir = lspconfig.util.root_pattern("package.json"),
    single_file_support = false,
}
-- Enable gopls
lspconfig.gopls.setup({})

lspconfig.golangci_lint_ls.setup({ autostart = false })
-- Optionally: enable golangci_lint_ls
lspconfig.golangci_lint_ls.setup({
  filetypes = { "go", "gomod" },
  root_dir = lspconfig.util.root_pattern("go.mod", "go.work", ".git"),
})



-- Java LSP setup (jdtls)
local home = os.getenv("HOME")
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
local workspace_dir = home .. "/.local/share/jdtls/workspace/" .. project_name
local lombok_path = home .. "/.m2/repository/org/projectlombok/lombok/1.18.34/lombok-1.18.34.jar" -- fixed missing slash
vim.fn.mkdir(workspace_dir, "p")

lspconfig.jdtls.setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,

    cmd = {
        "jdtls",
        "--jvm-arg=-javaagent:" .. lombok_path,
        -- "--jvm-arg=-Xbootclasspath/a:" .. lombok_path,
    },

    root_dir = lspconfig.util.root_pattern("mvnw", "gradlew", "pom.xml", "build.gradle"),

    settings = {
        java = {
            eclipse = { downloadSources = true },
            maven = { downloadSources = true },
            diagnostics = { enabled = true },
            implementationsCodeLens = { enabled = true },
            referencesCodeLens = { enabled = true },
            format = { enabled = true },
        },
    },

    init_options = {
        workspaceFolders = { name = project_name, uri = "file://" .. workspace_dir },
        bundles = {},
    },
}

