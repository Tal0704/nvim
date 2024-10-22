vim.opt.conceallevel = 1
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "zig", "cpp", "markdown", "markdown_inline"},

  sync_install = false,
  auto_install = true,

  highlight = {
    enable = true,
  },
}
