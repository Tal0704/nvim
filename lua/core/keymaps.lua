-- set numbers
vim.wo.nu  =  true
vim.o.rnu = true

-- set Tabs
vim.o.tabstop = 4 softtabstop=4
vim.o.shiftwidth = 4
vim.cmd [[set noexpandtab]]

--set shell to zsh
vim.go.shell = "/bin/zsh"

--set interactive mode 
vim.go.mouse = "a"

vim.g.mapleader  =  " "

vim.keymap.set('n', '<esc>', ':noh<CR>')
vim.g.camelcasemotion_key = ','

-- vim.keymap.set('n', '<Leader>r', ':IncRename ')

vim.opt.cursorline=true
