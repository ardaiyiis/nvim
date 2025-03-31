vim.cmd([[packadd packer.nvim]]) -- Load Packer explicitly

require("packer").startup(function(use)
	use "wbthomason/packer.nvim" -- Packer itself
	use "neovim/nvim-lspconfig"  -- LSP support
end)
-- add relative line numbers

print('from root')
require("ardila")
--vim.cmd('language en_US.UTF-8')
