-- Initialize Packer
local packer_exists = pcall(vim.cmd, [[packadd packer.nvim]])
if not packer_exists then
	vim.fn.system({
		"git",
		"clone",
		"https://github.com/wbthomason/packer.nvim",
		"~/.local/share/nvim/site/pack/packer/start/packer.nvim",
	})
end

-- Load plugins
require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	-- Telescope and its dependencies
	use({
		"nvim-telescope/telescope.nvim",
		requires = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-fzf-native.nvim" },
		config = function()
			require("telescope").load_extension("fzf")
		end,
	})

	-- nvim-treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})

	use("mbbill/undotree")
	use("tpope/vim-fugitive")

	-- LSP setup
	use({
		"VonHeikemen/lsp-zero.nvim",
		branch = "v1.x",
		requires = {
			"neovim/nvim-lspconfig",
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"hrsh7th/nvim-cmp",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-nvim-lua",
			"L3MON4D3/LuaSnip",
			"rafamadriz/friendly-snippets",
		},
	})

	use("onsails/lspkind.nvim")
	use({ "glepnir/lspsaga.nvim", commit = "4f075452c466df263e69ae142f6659dcf9324bf6" })
	use("jose-elias-alvarez/null-ls.nvim")
	use("jayp0521/mason-null-ls.nvim")

	use("christoomey/vim-tmux-navigator")
	use("szw/vim-maximizer")

	use("tpope/vim-surround")
	use("vim-scripts/ReplaceWithRegister")
	use("numToStr/Comment.nvim")

	-- File Explorer
	use({
		"nvim-tree/nvim-tree.lua",
		requires = "kyazdani42/nvim-web-devicons",
	})

	use("windwp/nvim-autopairs")
	use("lewis6991/gitsigns.nvim")

	-- Which-Key
	use({
		"folke/which-key.nvim",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
			require("which-key").setup({})
		end,
	})

	-- Tokyo Night colorscheme
	use({
		"folke/tokyonight.nvim",
		config = function()
			vim.cmd([[colorscheme tokyonight]])
		end,
	})

	use("m4xshen/smartcolumn.nvim")

	use("p00f/nvim-ts-rainbow")

	use("folke/trouble.nvim")
	-- Lualine
	use({
		"hoob3rt/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
		config = function()
			require("lualine").setup({
				options = {
					theme = "tokyonight",
					section_separators = { left = "", right = "" },
					component_separators = { left = "", right = "" },
				},
				extensions = { "nvim-tree" },
			})
		end,
	})
end)
