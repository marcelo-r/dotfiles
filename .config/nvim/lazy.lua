-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('', '\\', '<Nop>', {noremap = true, silent = true})

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
      {"nvim-lua/plenary.nvim"},
      {"neovim/nvim-lspconfig"},
      {"folke/neodev.nvim"},
      {"hrsh7th/cmp-nvim-lsp"},
      {"hrsh7th/cmp-buffer"},
      {"hrsh7th/cmp-path"},
      {"hrsh7th/cmp-cmdline"},
      {"hrsh7th/nvim-cmp"},
      {"SirVer/ultisnips"},
      {"folke/trouble.nvim"},
      {"williamboman/mason.nvim"},
      {"williamboman/mason-lspconfig.nvim"},
      {"nvim-tree/nvim-tree.lua"},
      {"ThePrimeagen/harpoon"},
      {"mfussenegger/nvim-dap"},
      {"easymotion/vim-easymotion"},
      {"nvim-telescope/telescope.nvim"},
      {"nvim-telescope/telescope-fzf-native.nvim"},
      {"jremmen/vim-ripgrep"},
      {"nvim-treesitter/nvim-treesitter"},
      {"nvim-treesitter/nvim-treesitter-textobjects"},
      {"j-hui/fidget.nvim"},
      {"tpope/vim-fugitive"},
      {"airblade/vim-gitgutter"},
      {"vim-airline/vim-airline"},
      {"nvim-tree/nvim-web-devicons"},
      {"machakann/vim-highlightedyank"},
      {"windwp/nvim-autopairs"},
      {"tpope/vim-surround"},
      {"lukas-reineke/indent-blankline.nvim"},
      {"tpope/vim-sleuth"},
      {"github/copilot.vim"},
      {"ray-x/go.nvim"},
      {"fatih/vim-go"},
      {"rust-lang/rust.vim"},
      {"sainnhe/sonokai"},
      {"joshdick/onedark.vim"},
      {"projekt0n/github-nvim-theme"},
      {"szw/vim-smartclose"},
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})

require("lua/plugins")
