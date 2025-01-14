local function load_snippets()
    local ls = require('luasnip')
    local s = ls.snippet
    local sn = ls.snippet_node
    local isn = ls.indent_snippet_node
    local t = ls.text_node
    local i = ls.insert_node
    local f = ls.function_node
    local c = ls.choice_node
    local d = ls.dynamic_node
    local r = ls.restore_node
    local events = require('luasnip.util.events')
    local ai = require('luasnip.nodes.absolute_indexer')
    local extras = require('luasnip.extras')
    local l = extras.lambda
    local rep = extras.rep
    local p = extras.partial
    local m = extras.match
    local n = extras.nonempty
    local dl = extras.dynamic_lambda
    local fmt = require('luasnip.extras.fmt').fmt
    local fmta = require('luasnip.extras.fmt').fmta
    local conds = require('luasnip.extras.expand_conditions')
    local postfix = require('luasnip.extras.postfix').postfix
    local types = require('luasnip.util.types')
    local parse = require('luasnip.util.parser').parse_snippet
    local ms = ls.multi_snippet
    local k = require('luasnip.nodes.key_indexer').new_key

    ls.add_snippets('go', {
        s('ie', fmt('if err != nil {{\n\t{}\n}}', i(1))),
        parse('ielf', 'if err != nil {\n\tlog.Fatal(err)\n}'),

        s('f', fmt('func {}({}) {} {{\n\t{}\n}}', {
            i(1, 'name'),
            i(2),
            i(3),
            i(0),
        })),

        s('m', fmt('func ({}) {}({}) {} {{\n\t{}\n}}', {
            i(1, 't *type'),
            i(2, 'name'),
            i(3),
            i(4),
            i(0),
        })),


        s('s', fmt('type {} struct {{\n\t{}\n}}', {
            i(1),
            i(0),
        })),

        s('go', fmt('go func() {{\n\t{}\n}}()', { i(1), })),
    })
end

return {
    'L3MON4D3/LuaSnip',
    version = 'v2.*',
    ft = 'go',
    build = 'make install_jsregexp',
    dependencies = {
        'saadparwaiz1/cmp_luasnip',
    },
    config = function()
        local ls = require('luasnip')

        ls.config.set_config {
            history = true,
            updateevents = 'TextChanged,TextChangedI',
            enable_autosnippets = true,
        }

        load_snippets()

        local map = require('utils').map
        local opts = { silent = true, }

        map({ 'i', 's', }, '<C-o>', function()
            if ls.expand_or_jumpable() then
                ls.expand_or_jump()
            end
        end, opts)

        map({ 'i', 's', }, '<C-n>', function()
            if ls.jumpable(-1) then
                ls.jump(-1)
            end
        end, opts)

        map({ 'i', 's', }, '<C-i>', function()
            if ls.choice_active() then
                ls.change_choice(1)
            end
        end, opts)

        map({ 'i', 's', }, '<C-e>', function()
            if ls.choice_active() then
                ls.change_choice(-1)
            end
        end, opts)

        map('n', '<Leader><Leader>s', '<Cmd>Lazy reload LuaSnip<Cr>', opts)
    end,
}
