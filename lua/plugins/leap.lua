return {
    "ggandor/leap.nvim",
    config = true,
    keys = {
        { 's', '<Plug>(leap-forward-to)',  mode = { 'n', 'x', 'o' }, desc = 'Leap forward' },
        { 'S', '<Plug>(leap-backward-to)', mode = { 'n', 'x', 'o' }, desc = 'Leap backward' },
    },
    opts = {
        highlight_unlabeled_phase_one_targets = true,
    }
}
