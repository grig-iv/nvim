return {
    'j-hui/fidget.nvim',
    tag = 'v1.0.0',
    event = { 'LspAttach' },
    opts = {
        progress = {
            display = {
                progress_icon = { pattern = 'dots_pulse', period = 1 },
            },
        },
        notification = {
            window = {
                winblend = 0,
            },
        },
    },
}
