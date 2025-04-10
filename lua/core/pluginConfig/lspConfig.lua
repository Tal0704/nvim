require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = {"lua_ls", "clangd", "zls", "basedpyright", "rust_analyzer"}
})

local on_attach = function(_, _)
	vim.keymap.set('n', '<Leader>rn', vim.lsp.buf.rename, {})
	vim.keymap.set('n', '<Leader>ca', vim.lsp.buf.code_action, {})

	vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
	vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
	vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

capabilities.textDocument.completion.completionItem.snippetSupport = true;

require("lspconfig").lua_ls.setup {
	on_attach = on_attach,
	capabilities = capabilities,
}

require("lspconfig").clangd.setup {
	on_attach = on_attach,
	capabilities = capabilities,
}

require("lspconfig").basedpyright.setup {
	on_attach = on_attach,
	capabilities = capabilities,
}

require("lspconfig").zls.setup {
	on_attach = on_attach,
	capabilities = capabilities,
}

require("lspconfig").rust_analyzer.setup {
	on_attach = on_attach,
	capabilities = capabilities,
}
