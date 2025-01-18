local dap = require("dap")
vim.keymap.set('n', '<Leader>db', dap.toggle_breakpoint, {})
vim.keymap.set('n', '<Leader>dc', dap.continue, {})
vim.keymap.set('n', '<Leader>ds', dap.step_over, {})
vim.keymap.set('n', '<F10>', dap.continue, {})
vim.keymap.set('n', '<F11>', dap.step_over, {})
vim.keymap.set('n', '<F12>', dap.step_into, {})


dap.adapters.cppdbg = {
	id = 'cppdbg',
	type = 'executable',
	command = '/usr/share/cpptools-debug/bin/OpenDebugAD7',
}

dap.configurations.cpp = {
	{
		name = "Launch file",
		type = "cppdbg",
		request = "launch",
		program = function()
			return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/bin/linux/debug/', 'file')
		end,
		cwd = '${workspaceFolder}',
		stopAtEntry = false,
	},
}

local dapui = require("dapui")
dapui.setup()
dap.listeners.before.attach.dapui_config = function()
	dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
	dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
	dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
	dapui.close()
end
