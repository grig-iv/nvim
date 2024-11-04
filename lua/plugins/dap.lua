return {
    'mfussenegger/nvim-dap',
    dependencies = {
        'leoluz/nvim-dap-go',
        'rcarriga/nvim-dap-ui',
        'theHamsta/nvim-dap-virtual-text',
        'nvim-neotest/nvim-nio',
    },
    lazy = false,
    keys = {
        { '<leader>tb', function() require('dap').toggle_breakpoint() end, },
        { '<leader>tc', function() require('dap').run_to_cursor() end, },
        { '<F1>',       function() require('dap').continue() end, },
        { '<F2>',       function() require('dap').step_into() end, },
        { '<F3>',       function() require('dap').step_over() end, },
        { '<F4>',       function() require('dap').step_out() end, },
        { '<F5>',       function() require('dap').step_back() end, },
        { '<F13>',      function() require('dap').restart() end, },
    },
    config = function()
        local dap = require 'dap'
        local ui = require 'dapui'

        require('dapui').setup()
        require('dap-go').setup()

        require('nvim-dap-virtual-text').setup()

        vim.keymap.set('n', '<space>?', function()
            require('dapui').eval(nil, { enter = true, })
        end)

        dap.defaults.fallback.external_terminal = {
            command = 'wezterm',
            args = { '-e', },
        }

        dap.listeners.before.attach.dapui_config = function()
            ui.open()
        end
        dap.listeners.before.launch.dapui_config = function()
            ui.open()
        end
        dap.listeners.before.event_terminated.dapui_config = function()
            ui.close()
        end
        dap.listeners.before.event_exited.dapui_config = function()
            ui.close()
        end
    end,
}
