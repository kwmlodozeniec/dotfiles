local config = require("plugins.configs.lspconfig")

local on_attach = config.on_attach
local capabilities = config.capabilities

local lspconfig = require("lspconfig")
local util = require "lspconfig/util"

lspconfig.pyright.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = {"python"}
})

lspconfig.gopls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = {"gopls"},
    filetypes = {"go", "gomod", "gowork", "gotmpl"},
    root_dir = util.root_pattern("go.work", "go.mod", ".git"),
    settings = {
        completeUnimported = true,
        usePlaceholders = true,
        analyses = {
            unusedparams = true
        }
    }
})
