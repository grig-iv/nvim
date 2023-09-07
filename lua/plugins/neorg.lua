return {
    {
        'nvim-neorg/neorg',
        build = ':Neorg sync-parsers',
        dependencies = { 'nvim-lua/plenary.nvim', 'nvim-treesitter/nvim-treesitter' },
        opts = {
            load = {
                ['core.defaults'] = {}, -- Loads default behaviour
                ['core.concealer'] = {

                    config = {
                        folds = true,
                        icon_preset = 'diamond',
                    },
                }, -- Adds pretty icons to your documents
                ['core.dirman'] = { -- Manages Neorg workspaces
                    config = {
                        workspaces = {
                            mind = '~/extended-mind',
                            default_workspace = 'mind',
                        },
                    },
                },
            },
        },
    },
}
