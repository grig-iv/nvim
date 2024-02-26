return {
    'tzachar/local-highlight.nvim',
    event = 'BufReadPost',
    opts = {
        hlgroup = 'Underlined',
        disable_file_types = { 'norg' }, -- FIXME dosen't work
    }
}
