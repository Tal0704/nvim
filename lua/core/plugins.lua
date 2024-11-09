local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
		vim.cmd [[packadd packer.nvim]]
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	use 'nvim-tree/nvim-tree.lua'
 	use 'nvim-tree/nvim-web-devicons'
	use {'nvim-lualine/lualine.nvim', requires = { 'nvim-tree/nvim-web-devicons', opt = true }}
	use 'bkad/CamelCaseMotion'
	use 'junegunn/fzf'
	use 'junegunn/fzf.vim'
	use 'morhetz/gruvbox'
	use 'rebelot/kanagawa.nvim'
	use "neanias/everforest-nvim"
	use 'mfussenegger/nvim-dap'

	use 'rhysd/vim-color-spring-night'
	use 'jiangmiao/auto-pairs'
	use 'tpope/vim-surround'
	use 'tpope/vim-fugitive'
	use 'tpope/vim-commentary'
	use 'nvim-treesitter/nvim-treesitter'
	use {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig"
	}
	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'L3MON4D3/LuaSnip'
	use 'christoomey/vim-tmux-navigator'

	use({
	  "epwalsh/obsidian.nvim",
	  tag = "*",  -- recommended, use latest release instead of latest commit
	  requires = {
		-- Required.
		"nvim-lua/plenary.nvim",

	  },
	  config = function()
		require("obsidian").setup({
		  workspaces = {
			{
			  name = "release",
			  path = "~/Documents/Obsidian Vault/release",
			},
		  },

		})
	  end,
	})

  -- Automatically set up your configuration after cloning packer.nvim
	if packer_bootstrap then
		require('packer').sync()
	end
end)
