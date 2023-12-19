local function icons_setup()
    local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
    for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end
end

return {
    'neovim/nvim-lspconfig',
    event = { 'BufReadPre', 'BufNewFile' },
    priority = 500,
    dependencies = {
        'folke/neodev.nvim',
    },
    config = function()
        require('neodev').setup()

        icons_setup()

        -- Setup language servers.
        local lspconfig = require('lspconfig')
        local capabilities = require('cmp_nvim_lsp').default_capabilities()

        vim.diagnostic.config({
            virtual_text = false,
        })

        lspconfig.lua_ls.setup({
            capabilities = capabilities,
            settings = {
                Lua = {
                    workspace = {
                        checkThirdParty = false,
                    }
                }
            }
        })

        lspconfig.nil_ls.setup({
            capabilities = capabilities,
            autostart = true,
            settings = {
                ['nil'] = {
                    formatting = {
                        command = { 'alejandra', '--quiet' },
                    },
                },
            },
        })

        lspconfig.pylsp.setup {
            capabilities = capabilities,
            -- settings = {
            --     pylsp = {
            --         plugins = {
            --             pycodestyle = {
            --                 ignore = { 'W391' },
            --                 maxLineLength = 100
            --             }
            --         }
            --     }
            -- }
        }
        lspconfig.clojure_lsp.setup({
            capabilities = capabilities,
        })

        lspconfig.ocamllsp.setup({
            capabilities = capabilities,
        })

        lspconfig.gopls.setup({
            capabilities = capabilities,
        })

        lspconfig.glsl_analyzer.setup({
            capabilities = capabilities,
        })

        lspconfig.fennel_language_server.setup({
            capabilities = capabilities,
            settings = {
                fennel = {
                    workspace = {
                        library = vim.api.nvim_list_runtime_paths(),
                    },
                    diagnostics = {
                        globals = { 'vim', 'awesome' },
                    },
                },
            },
        })

        --[[
        lspconfig.fennel_ls.setup({
            capabilities = capabilities,
            settings = {
                ["fennel-ls"] = {
                    ["checks"] = {
                        ["unknown-module-field"] = false,
                    },
                },
            }
        })

        lspconfig.metals.setup({
            capabilities = capabilities,
        })

        lspconfig.rescriptls.setup({
            cmd = { 'node', '/home/grig-iv/.local/share/nvim/lazy/vim-rescript/server/out/server.js', '--stdio' },
        })

        lspconfig.hls.setup({
            capabilities = capabilities,
        })
        --]]
        -- Global mappings.
        -- See `:help vim.diagnostic.*` for documentation on any of the below functions
        vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
        vim.keymap.set('n', '<S-Left>', vim.diagnostic.goto_prev)
        vim.keymap.set('n', '<S-Right>', vim.diagnostic.goto_next)
        vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)


        local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

        -- Use LspAttach autocommand to only map the following keys
        -- after the language server attaches to the current buffer
        vim.api.nvim_create_autocmd('LspAttach', {
            group = vim.api.nvim_create_augroup('UserLspConfig', {}),
            callback = function(ev)
                vim.api.nvim_clear_autocmds({ group = augroup, buffer = ev.buf })
                vim.api.nvim_create_autocmd("BufWritePre", {
                    group = augroup,
                    buffer = ev.buf,
                    callback = function()
                        vim.lsp.buf.format()
                    end,
                })

                -- Enable completion triggered by <c-x><c-o>
                vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

                -- Enable signcolumn for lsp icons in gutter (for removing twitches)
                vim.wo.signcolumn = "yes"

                -- Buffer local mappings.
                -- See `:help vim.lsp.*` for documentation on any of the below functions
                local opts = { buffer = ev.buf }
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
            end,
        })
    end,
}
