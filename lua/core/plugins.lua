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
-- color schemes:
	use 'catppuccin/nvim'
	use 'sainnhe/gruvbox-material'
	use 'morhetz/gruvbox'
	use 'rebelot/kanagawa.nvim'
	use "neanias/everforest-nvim"
	use 'zaldih/themery.nvim'

-- navigation:
	use 'nvim-tree/nvim-tree.lua'
 	use 'nvim-tree/nvim-web-devicons'
	use 'bkad/CamelCaseMotion'
	use 'junegunn/fzf'
	use 'junegunn/fzf.vim'
	use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.8',
	  requires = { {'nvim-lua/plenary.nvim'} }
	}
	use 'nvim-treesitter/nvim-treesitter'
	use 'christoomey/vim-tmux-navigator'
	use {
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		requires = { {"nvim-lua/plenary.nvim"} }
	}

-- debugging
	use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"} }

-- git
	use 'airblade/vim-gitgutter'
	use 'tpope/vim-fugitive'

-- lsp
	use "neovim/nvim-lspconfig"
	use "williamboman/mason.nvim"
	use "williamboman/mason-lspconfig.nvim"
	use 'ray-x/lsp_signature.nvim'
	use 'simrat39/rust-tools.nvim'

-- autocomplete
	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'L3MON4D3/LuaSnip'

-- misc
	use 'akinsho/toggleterm.nvim'
	use {'nvim-lualine/lualine.nvim', requires = { 'nvim-tree/nvim-web-devicons', opt = true }}
	use 'jiangmiao/auto-pairs'
	use 'tpope/vim-surround'
	use 'tpope/vim-commentary'

-- obsidian
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
			  path = "~/Documents/notes",
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


