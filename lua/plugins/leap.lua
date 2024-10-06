return {
    'ggandor/leap.nvim',
    keys = {
        { 'F', '<Plug>(leap-forward-to)',  mode = { 'n', 'x', 'o', }, desc = 'Leap forward', },
        { 'W', '<Plug>(leap-backward-to)', mode = { 'n', 'x', 'o', }, desc = 'Leap backward', },
    },
    opts = {
        highlight_unlabeled_phase_one_targets = true,
    },
}
