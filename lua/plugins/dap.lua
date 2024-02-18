local function dap(method)
    return function()
        require('dap')[method]()
    end
end

return {
    'mfussenegger/nvim-dap',
    keys = {
        { '<F6>',  dap('toggle_breakpoint') },
        { '<F7>',  dap('continue') },
        { '<F8>',  dap('step_out') },
        { '<F9>',  dap('step_into') },
        { '<F10>', dap('step_over') },
    },
}
