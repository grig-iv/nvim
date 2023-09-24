return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    cmd = { 'TSUpdateSync' },
    config = function(_, opts)
        require('nvim-treesitter.configs').setup(opts)

        -- FSharp
        local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
        parser_config.fsharp = {
          install_info = {
            url = "https://github.com/Nsidorenco/tree-sitter-fsharp",
            branch = "develop",
            files = {"src/scanner.cc", "src/parser.c" },
            generate_requires_npm = true,
            requires_generate_from_grammar = true
          },
          filetype = "fsharp",
        }
    end,
    opts = {
        sync_install = false,
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
        ensure_installed = {
            'norg',
            'bash',
            'json',
            'yaml',
            'markdown',
            'markdown_inline',
            'lua',
        },
    },
}
