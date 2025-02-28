return {
      "nvim-lua/plenary.nvim",
      "neovim/nvim-lspconfig",
      {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
          library = {
            -- See the configuration section for more details
            -- Load luvit types when the `vim.uv` word is found
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/nvim-cmp",
      "folke/trouble.nvim",
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "nvim-tree/nvim-tree.lua",
      "ThePrimeagen/harpoon",
      "mfussenegger/nvim-dap",
      "easymotion/vim-easymotion",
      "nvim-telescope/telescope.nvim",
      "nvim-telescope/telescope-fzf-native.nvim",
      "jremmen/vim-ripgrep",
      "nvim-treesitter/nvim-treesitter",
      "nvim-treesitter/nvim-treesitter-textobjects",
      "j-hui/fidget.nvim",
      "tpope/vim-fugitive",
      "airblade/vim-gitgutter",
      "vim-airline/vim-airline",
      "nvim-tree/nvim-web-devicons",
      "machakann/vim-highlightedyank",
      "windwp/nvim-autopairs",
      "tpope/vim-surround",
      "lukas-reineke/indent-blankline.nvim",
      "tpope/vim-sleuth",
      "github/copilot.vim",
      "ray-x/go.nvim",
      "fatih/vim-go",
      "rust-lang/rust.vim",
      {
        "sainnhe/sonokai",
        config = function()
          vim.g.sonokai_diagnostic_text_highlight = 1
          vim.g.sonokai_disable_italic_comment=1
          vim.g.sonokai_style = 'atlantis'
        end,
      },
      "joshdick/onedark.vim",
      {
        "projekt0n/github-nvim-theme",
        config = function()
          vim.g.github_comment_style = 'none'
        end,
      },
      "szw/vim-smartclose",
}
