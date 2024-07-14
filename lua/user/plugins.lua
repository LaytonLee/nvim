local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	-- My plugins here
	use({ "wbthomason/packer.nvim", commit = "ea0cc3c59f67c440c5ff0bbe4fb9420f4350b9a3" }) -- Have packer manage itself
	use({ "nvim-lua/plenary.nvim", tag = "v0.1.4" }) -- Useful lua functions used by lots of plugins
	use({ "windwp/nvim-autopairs", commit = "78a4507bb9ffc9b00f11ae0ac48243d00cb9194d" }) -- Autopairs, integrates with both cmp and treesitter
	use({ "numToStr/Comment.nvim", tag = "v0.8.0" })
	use({ "JoosepAlviste/nvim-ts-context-commentstring", commit = "6b5f95aa4d24f2c629a74f2c935c702b08dbde62" })
	use({ "kyazdani42/nvim-web-devicons", tag = "v0.100" })
	use({ "kyazdani42/nvim-tree.lua", tag = "v1.5.0" })
	use({ "akinsho/bufferline.nvim", tag = "v4.6.1" })
	use({ "moll/vim-bbye", tag = "v1.0.1" })
	use({ "nvim-lualine/lualine.nvim", commit = "6a40b530539d2209f7dc0492f3681c8c126647ad" })
	use({ "akinsho/toggleterm.nvim", tag = "v2.11.0" })
	use({ "ahmedkhalf/project.nvim", commit = "8c6bad7d22eef1b71144b401c9f74ed01526a4fb" })
	use({ "lewis6991/impatient.nvim", tag = "v0.2" })
	use({ "lukas-reineke/indent-blankline.nvim", tag = "v3.7.1" })
	use({ "goolord/alpha-nvim", commit = "41283fb402713fc8b327e60907f74e46166f4cfd" })
	use("folke/which-key.nvim")

	-- Colorschemes tokyonight
	use({ "folke/tokyonight.nvim", tag = "v4.5.0" })
	use("lunarvim/darkplus.nvim")
  	-- Colorschemes deus
  	use("ajmwagar/vim-deus")
  	use("vim-airline/vim-airline")
  	use("vim-airline/vim-airline-themes")

	-- cmp plugins
	use({ "hrsh7th/nvim-cmp", tag = "v0.0.1" }) -- The completion plugin
	use({ "hrsh7th/cmp-buffer", commit = "3022dbc9166796b644a841a02de8dd1cc1d311fa" }) -- buffer completions
	use({ "hrsh7th/cmp-path", commit = "91ff86cd9c29299a64f968ebb45846c485725f23" }) -- path completions
	use({ "saadparwaiz1/cmp_luasnip", commit = "05a9ab28b53f71d1aece421ef32fee2cb857a843" }) -- snippet completions
	use({ "hrsh7th/cmp-nvim-lsp", commit = "39e2eda76828d88b773cc27a3f61d2ad782c922d" })
	use({ "hrsh7th/cmp-nvim-lua", commit = "f12408bdb54c39c23e67cab726264c10db33ada8" })

	-- snippets
	use({ "L3MON4D3/LuaSnip", tag = "v2.3.0" }) --snippet engine
	use({ "rafamadriz/friendly-snippets", commit = "45a1b96e46efe5fce8af325d4bed45feb9d29d0f" }) -- a bunch of snippets to use

	-- LSP
        use({ "williamboman/mason.nvim", tag = "v1.10.0" })
	-- use({ "neovim/nvim-lspconfig", tag = "v0.1.8" }) -- enable LSP
	-- use({ "williamboman/nvim-lsp-installer", commit = "17e0bfa5f2c8854d1636fcd036dc8284db136baa" }) -- simple to use language server installer
	-- use({ "jose-elias-alvarez/null-ls.nvim", commit = "0010ea927ab7c09ef0ce9bf28c2b573fc302f5a7" }) -- for formatters and linters

	-- Telescope
	use({ "nvim-telescope/telescope.nvim", tag = "0.1.8" })

	-- Treesitter
	use({ "nvim-treesitter/nvim-treesitter", tag = "v0.9.2" })

	-- Git
	use({ "lewis6991/gitsigns.nvim", commit = "e9c4187c3774a46df2d086a66cf3a7e6bea4c432" })

  	-- coc
  	use ({'neoclide/coc.nvim', branch = 'release'})

  	-- markdown-preview
  	use({ "iamcco/markdown-preview.nvim", tag = "v0.0.10", run = function() vim.fn["mkdp#util#install"]() end, })

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
