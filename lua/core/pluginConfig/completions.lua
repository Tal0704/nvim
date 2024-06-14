local cmp = require("cmp")

cmp.setup({
	mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
	  ['<Tab>'] = function()
		  local cmp = require 'cmp'
		  if cmp.visible() then
			  cmp.select_next_item()
		  else
			  vim.fn.feedkeys('	', 'nt')
		  end
	  end,
		  -- cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }),
	  ['<S-Tab>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-y>'] = cmp.config.disable,
      ['<C-e>'] = cmp.mapping({
          i = cmp.mapping.abort(),
          c = cmp.mapping.close(),
        }),
      ['<CR>'] = cmp.mapping.confirm({ select = false, behavior = cmp.ConfirmBehavior.Insert }),
	}),
	snippet = {
		expand = function(args)
			-- vim.fn["vsnip#anonymous"](args.body)
			require('luasnip').lsp_expand(args.body)
		end,
	},
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = 'luasnip' },
	}, {
		{name = "buffer"},
	}),
})

