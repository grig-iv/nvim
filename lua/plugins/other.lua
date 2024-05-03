return {
    'rgroli/other.nvim',
    event = 'VeryLazy',
    config = function(_, opts)
        require('other-nvim').setup(opts)
    end,
    opts = {
        mappings = {
            {
                pattern = '/fnl/(.*)/(.*).fnl$',
                target = '/lua/%1/%2.lua',
            },
        },
    },
}
