return {
    "numToStr/Comment.nvim",
    opts = {},
    keys = {
        { "<C-c>", "<Cmd>normal gcc<Cr>" },
        { "<C-c>", function() _G.api.nvim_feedkeys("gc", "v", false) end, mode = "v" } }
}
