return {
    'j-hui/fidget.nvim',
    tag = 'legacy',
    event = { 'LspAttach' },
    opts = {
        text = {
            spinner = "dots_pulse"
        },
        window = {
            blend = 0, -- transparent background
        },
    },
}
