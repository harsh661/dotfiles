vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Simple plugins can be specified as strings
  use 'rstacruz/vim-closer'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.2',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  use { "ellisonleao/gruvbox.nvim" }

  use { "catppuccin/nvim", as = "catppuccin" }

  use { "shaunsingh/nord.nvim" }

  use { "arzg/vim-colors-xcode", as = "xcode" }

  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

  use {
      'VonHeikemen/lsp-zero.nvim',
      branch = 'v2.x',
      requires = {
          -- LSP Support
          {'neovim/nvim-lspconfig'},             -- Required
          {                                      -- Optional
          'williamboman/mason.nvim',
          run = function()
              pcall(vim.cmd, 'MasonUpdate')
          end,
      },
      {'williamboman/mason-lspconfig.nvim'}, -- Optional

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},     -- Required
      {'hrsh7th/cmp-nvim-lsp'}, -- Required
      {'L3MON4D3/LuaSnip'},     -- Required
  }
  } 
  use('nvim-lua/plenary.nvim')

  use('ThePrimeagen/harpoon')

  use('nvim-tree/nvim-tree.lua')

  use('mbbill/undotree')

  use {
  "windwp/nvim-autopairs",
  wants = "nvim-treesitter",
  module = { "nvim-autopairs.completion.cmp", "nvim-autopairs" },
  config = function()
    require("config.autopairs").setup()
  end,
}

end)
