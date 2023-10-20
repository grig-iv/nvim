return {
    'lukas-reineke/indent-blankline.nvim',
    main = "ibl",
    event = { 'BufReadPost', 'BufNewFile' },
    opts = {
        indent = {
            char = "┊",
        },
        scope = {
            char = "┆",
            highlight = { "Function", "Label" },
            show_start = false,
            show_end = false,
        },
    }
}
