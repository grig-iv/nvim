local function servers_setup()
    local lspconfig = require('lspconfig')
    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
    local server_list = {
        'lua_ls',
        'nil_ls',
        'clangd',
        'gopls',
        'ocamllsp',
        'svelte',
        -- 'clojure_lsp',
        -- "metals",
        -- "hls",
        -- "glsl_analyzer",
    }


    for _, server in ipairs(server_list) do
        lspconfig[server].setup({
            capabilities = capabilities,
            settings = {
                Lua = {
                    workspace = {
                        checkThirdParty = false,
                    },
                },
                gopls = {
                    completeUnimported = true,
                    usePlaceholders = true,
                },
                pylsp = {
                    plugins = {
                        pycodestyle = {
                            ignore = { 'W391', },
                            maxLineLength = 100,
                        },
                    },
                },
                ['nil'] = {
                    formatting = {
                        command = { 'alejandra', '--quiet', },
                    },
                },
            },
        })
    end

    lspconfig['tailwindcss'].setup({
        capabilities = capabilities,
        filetypes = { 'svelte', },
    })
end


local function icons_setup()
    local signs = { Error = '󰅙 ', Warn = '󰀦 ', Hint = '󰌵 ', Info = '󰋼 ', }
    for type, icon in pairs(signs) do
        local hl = 'DiagnosticSign' .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '', })
    end
end

return {
    'neovim/nvim-lspconfig',
    event = { 'BufReadPre', 'BufNewFile', },
    priority = 500,
    dependencies = {
        'folke/neodev.nvim',
        config = function()
            require('neodev').setup()

            servers_setup()
            icons_setup()

            vim.diagnostic.config({
                virtual_text = false,
            })

            -- Global mappings.
            -- See `:help vim.diagnostic.*` for documentation on any of the below functions
            vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
            vim.keymap.set('n', '<BS>e', vim.diagnostic.goto_prev)
            vim.keymap.set('n', '<Enter>e', vim.diagnostic.goto_next)
            vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

            local augroup = vim.api.nvim_create_augroup('LspFormatting', {})

            -- Use LspAttach autocommand to only map the following keys
            -- after the language server attaches to the current buffer
            vim.api.nvim_create_autocmd('LspAttach', {
                group = vim.api.nvim_create_augroup('UserLspConfig', {}),
                callback = function(ev)
                    vim.api.nvim_clear_autocmds({ group = augroup, buffer = ev.buf, })
                    vim.api.nvim_create_autocmd('BufWritePre', {
                        group = augroup,
                        buffer = ev.buf,
                        callback = function()
                            vim.lsp.buf.format()
                        end,
                    })

                    -- Enable completion triggered by <c-x><c-o>
                    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

                    -- Enable signcolumn for lsp icons in gutter (for removing twitches)
                    vim.wo.signcolumn = 'yes'

                    -- Buffer local mappings.
                    -- See `:help vim.lsp.*` for documentation on any of the below functions
                    local opts = { buffer = ev.buf, }
                    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
                    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
                    vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, opts)

                    vim.keymap.set('n', 'h', vim.lsp.buf.hover, opts)
                    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)

                    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
                    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
                    vim.keymap.set('n', '<space>wl', function()
                        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                    end, opts)

                    vim.keymap.set('n', '<C-r>', vim.lsp.buf.rename, opts)
                    vim.keymap.set({ 'n', 'v', }, '<C-a>', vim.lsp.buf.code_action, opts)
                end,
            })
        end,
    },
}
