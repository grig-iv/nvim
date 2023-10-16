return {
    'scalameta/nvim-metals',
    dependencies = { "nvim-lua/plenary.nvim" },
    ft = { "scala", "sbt", "java" },
    config = function()
        local metals = require("metals").bare_config()
        metals.settings = {
            metalsBinaryPath = "/nix/store/vmhdqv1ajbdxgj3qs8qhfcf8nr2pcbww-metals-1.0.1/bin/metals",
            showImplicitArguments = true,
            showImplicitConversionsAndClasses = true,
            showInferredType = true,
            excludedPackages = {
                "akka.actor.typed.javadsl",
                "com.github.swagger.akka.javadsl"
            }
        }

        metals.on_attach = function(client, bufnr)
            local opts = { buffer = bufnr }
            vim.keymap.set('n', '<Enter>', vim.lsp.buf.definition, opts)
            vim.keymap.set('n', '<S-Enter>', vim.lsp.buf.implementation, opts)
            vim.keymap.set('n', '<C-Enter> ', vim.lsp.buf.type_definition, opts)
            vim.keymap.set('n', '<C-S-Enter>', vim.lsp.buf.definition, opts)
            vim.keymap.set('n', '<C-u>', vim.lsp.buf.references, opts)

            vim.keymap.set('n', 'h', vim.lsp.buf.hover, opts)
            vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)

            vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
            vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
            vim.keymap.set('n', '<space>wl', function()
                print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
            end, opts)

            vim.keymap.set('n', '<C-r>', vim.lsp.buf.rename, opts)
            vim.keymap.set({ 'n', 'v' }, '<C-a>', vim.lsp.buf.code_action, opts)
            vim.keymap.set('n', '<C-o>', function()
                vim.lsp.buf.format({ async = true })
            end, opts)
        end

        local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
        vim.api.nvim_create_autocmd("FileType", {
            -- NOTE: You may or may not want java included here. You will need it if you
            -- want basic Java support but it may also conflict if you are using
            -- something like nvim-jdtls which also works on a java filetype autocmd.
            pattern = { "scala", "sbt", "java" },
            callback = function()
                require("metals").initialize_or_attach(metals)
            end,
            group = nvim_metals_group,
        })
    end,
}
