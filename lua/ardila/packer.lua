-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.8',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }


  use( {
	  "rose-pine/neovim", 
	  name = "rose-pine",
	  config = function()
		  vim.cmd("colorscheme rose-pine")
	  end
  })
  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use( 'nvim-treesitter/playground')
  use( 'ThePrimeagen/harpoon' ) 
  use( 'mbbill/undotree') 
  use( 'tpope/vim-fugitive') 

  use {
	  "neovim/nvim-lspconfig",  -- LSP support
	  requires = {
		  "williamboman/mason.nvim",         -- LSP installer
		  "williamboman/mason-lspconfig.nvim", -- Integration with LSPconfig
	  },
	  config = function()
		  require("mason").setup()
		  require("mason-lspconfig").setup({
			  ensure_installed = { "lua_ls", "tsserver", "html", "cssls" }, -- Add the languages you need
			  automatic_installation = true,
		  })

		  local lspconfig = require("lspconfig")
		  lspconfig.lua_ls.setup({})
		  lspconfig.tsserver.setup({})
		  lspconfig.html.setup({})
		  lspconfig.cssls.setup({})
	  end
  }

  use {
	  'github/copilot.vim',
	  config = function()
		  -- Copilot Configuration (optional)
		  vim.g.copilot_no_tab_map = true   -- Disable default tab mapping
		  vim.api.nvim_set_keymap("i", "<Tab>", 'copilot#Accept()', { expr = true, noremap = true }) -- Map Copilot to Ctrl+J
	  end
  }


end)
