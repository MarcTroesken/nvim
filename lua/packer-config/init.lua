local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- Color Schemes
  -- use "EdenEast/nightfox.nvim"
  -- use "gruvbox-community/gruvbox"
  --[[ use "joshdick/onedark.vim" ]]
  -- use "phanviet/vim-monokai-pro"
  -- use "mhartington/oceanic-next"
  --[[ use {"dracula/vim", as = "dracula"} ]]
  use { "catppuccin/nvim", as = "catppuccin" }

  -- Plugins
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
  use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter
  use "kyazdani42/nvim-web-devicons"
  use "kyazdani42/nvim-tree.lua"
  use "nvim-lualine/lualine.nvim"
  use "numToStr/Comment.nvim"
  use "JoosepAlviste/nvim-ts-context-commentstring"
  use {"akinsho/toggleterm.nvim", tag = 'v1.*'}
  use {'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons'}
  use "moll/vim-bbye"
  use "hashivim/vim-terraform"
  use "mhinz/vim-startify"
  use "lukas-reineke/indent-blankline.nvim"

  -- cmp plugins
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "onsails/lspkind-nvim" -- vscode-like pictograms for neovim lsp completion items
  use "hrsh7th/cmp-nvim-lsp" -- LSP source for nvim-cmp
	use "saadparwaiz1/cmp_luasnip" -- Snippets source for nvim-cmp

  -- LSP
  use "neovim/nvim-lspconfig" -- enable LSP
  use "williamboman/mason.nvim"
  use "williamboman/mason-lspconfig.nvim"
  use "dart-lang/dart-vim-plugin" -- dart syntax highlight
  use {'akinsho/flutter-tools.nvim', requires = 'nvim-lua/plenary.nvim'}

  -- Telescope
  use "nvim-telescope/telescope.nvim"
  use "nvim-telescope/telescope-media-files.nvim"
  use "nvim-telescope/telescope-file-browser.nvim"

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }

  -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine

  -- Git
  use "lewis6991/gitsigns.nvim"
  use "f-person/git-blame.nvim"

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
