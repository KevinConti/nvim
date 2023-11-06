return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        { "antosha417/nvim-lsp-file-operations", config = true },
    },
    config = function()
        local lspconfig = require("lspconfig")
        local cmp_nvim_lsp = require("cmp_nvim_lsp")

        local keymap = vim.keymap

        local opts = { noremap = true, silent = true }
        local on_attach = function(client, bufnr)
            opts.buffer = bufnr

            -- set keybinds on attach for each language server
            opts.desc = "Show LSP references"
            keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show references
            opts.desc = "[G]o to [D]eclaration"
            keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

            opts.desc = "Show LSP definitions"
            keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

            opts.desc = "Show LSP implementations"
            keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- go to implementations

            opts.desc = "See available code actions"
            keymap.set({"n", "v"}, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions

            opts.desc = "Show Documentation"
            keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show Documentation for what is under the cursor
        end

        local capabilities = cmp_nvim_lsp.default_capabilities()


        --[[ 
        -- By default, elixir-ls doesn't have a cmd set. This is because nvim-lspconfig does not make assumptions about your path. You must add the following to your init.vim or init.lua to set cmd to the absolute path ($HOME and ~ are not expanded) of your unzipped elixir-ls.
        --https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#elixirls:~:text=By%20default%2C%20elixir%2Dls%20doesn%27t%20have%20a%20cmd%20set.%20This%20is%20because%20nvim%2Dlspconfig%20does%20not%20make%20assumptions%20about%20your%20path.%20You%20must%20add%20the%20following%20to%20your%20init.vim%20or%20init.lua%20to%20set%20cmd%20to%20the%20absolute%20path%20(%24HOME%20and%20~%20are%20not%20expanded)%20of%20your%20unzipped%20elixir%2Dls. ]]
        lspconfig["elixirls"].setup({
            -- cmd = { uv.os_homedir().."/mason/packages/elixir-ls/language_server.sh" };
             cmd = {  "C:/Users/Kevco/AppData/Local/nvim-data/mason/packages/elixir-ls/language_server.bat" },
             root_dir = lspconfig.util.root_pattern('mix.exs'),
             capabilities,
             on_attach = on_attach
        })


        lspconfig["lua_ls"].setup({
            capabilities,
            on_attach = on_attach,
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { "vim" },
                    },
                    workspace = {
                        library = {
                            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                            [vim.fn.stdpath("config") .. "/lua"] = true
                        },
                    },
                },
            },
        })
    end
}
