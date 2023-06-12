local plugins = {{
    "rcarriga/nvim-dap-ui",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
        local dap = require("dap")
        local dapui = require("dapui")
        dapui.setup()
        dap.listeners.after.event_initialized["dapui_config"] = function()
            dapui.open()
        end
        dap.listeners.before.event_terminated["dapui_config"] = function()
            dapui.close()
        end
        dap.listeners.before.event_exited["dapui_config"] = function()
            dapui.close()
        end
    end
}, {
    "mfussenegger/nvim-dap",
    config = function(_, opts)
        require("core.utils").load_mappings("dap")
    end
}, {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {"mfussenegger/nvim-dap", "rcarriga/nvim-dap-ui"},
    config = function(_, opts)
        local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
        require("dap-python").setup(path)
        require("core.utils").load_mappings("dap_python")
    end
}, {
    "leoluz/nvim-dap-go",
    ft = "go",
    dependencies = {"mfussenegger/nvim-dap", "rcarriga/nvim-dap-ui"},
    config = function(_, opts)
        require("dap-go").setup(opts)
        require("core.utils").load_mappings("dap_go")
    end
}, {
    "olexsmir/gopher.nvim",
    ft = "go",
    config = function(_, opts)
        require("gopher").setup(opts)
        require("core.utils").load_mappings("gopher")
    end,
    build = function()
        vim.cmd [[silent! GoInstallDeps]]
    end
}, {
    "jose-elias-alvarez/null-ls.nvim",
    ft = {"python", "go"},
    opts = function()
        return require "custom.configs.null-ls"
    end
}, {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function()
        vim.g.rustfmt_autosave = 1
    end
}, {
    "simrat39/rust-tools.nvim",
    ft = "rust",
    dependencies = "neovim/nvim-lspconfig",
    opts = function()
        return require "custom.configs.rust-tools"
    end,
    config = function(_, opts)
        require("rust-tools").setup(opts)
    end
}, {
    "saecki/crates.nvim",
    ft = {"rust", "toml"},
    config = function(_, opts)
        local crates = require("crates")
        crates.setup(opts)
        crates.show()
    end
}, {
    "hrsh7th/nvim-cmp",
    opts = function()
        local M = require "plugins.configs.cmp"
        table.insert(M.sources, {
            name = "crates"
        })
        return M
    end
}, {
    "williamboman/mason.nvim",
    opts = {
        ensure_installed = {"black", "debugpy", "mypy", "ruff", "pyright", "gopls", "rust-analyzer"}
    }
}, {
    "neovim/nvim-lspconfig",
    config = function()
        require "plugins.configs.lspconfig"
        require "custom.configs.lspconfig"
    end
}, {
    "nvim-treesitter/nvim-treesitter",
    opts = function()
        return require "custom.configs.treesitter"
    end
}}
return plugins
