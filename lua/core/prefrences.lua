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

vim.cmd [[set nowrap]]

local signs = { Error = "✗ ", Warn = "󰀪 ", Hint = "󰌶 ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.diagnostic.config({
  virtual_text = true,
})
