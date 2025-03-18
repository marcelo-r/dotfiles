return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {"nvim-treesitter/nvim-treesitter-textobjects"},
  build = ":TSUpdate",
  config = function()
    -- Defer Treesitter setup after first render to improve startup time of 'nvim {filename}'
      require('nvim-treesitter.configs').setup {
        -- Add languages to be installed here that you want installed for treesitter
        sync_install = false,
        ensure_installed = {
          'go',
          'lua',
          'python',
          'rust',
          'tsx',
          'javascript',
          'typescript',
          'vim',
          'bash',
          'elixir'
        },
        modules = {},
        ignore_install = {},

        -- Autoinstall languages that are not installed. Defaults to false (but you can change for yourself!)
        auto_install = false,

        highlight = {
          enable = true,
          disable = { "rust" },
        },
        indent = { enable = true },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = '<c-space>',
            node_incremental = '<c-space>',
            scope_incremental = '<c-s>',
            node_decremental = '<M-space>',
          },
        },
        textobjects = {
          select = {
            enable = true,
            lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
          },
        },
      }
  end,
}
