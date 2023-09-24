return {
    'Pocco81/auto-save.nvim',
    event = { 'BufReadPost', 'BufNewFile' },
    opts = {
        execution_message = {
            message = function()
                return ''
            end,
        },
    },
}
