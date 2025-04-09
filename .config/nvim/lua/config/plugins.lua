return require('lazy').setup({
  -- Color scheme
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  
  -- Essential plugins
  { "nvim-lua/plenary.nvim", lazy = false },      -- Lua functions library
  
  -- File explorer
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup({
        filters = {
          dotfiles = false,
        },
        renderer = {
          group_empty = true,
          icons = {
            show = {
              file = true,
              folder = true,
              folder_arrow = true,
              git = true,
            },
          },
        },
      })
    end,
  },
  
  -- Essential plugins for development
  { 
    "nvim-treesitter/nvim-treesitter", 
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { 
          "lua", "vim", "vimdoc", "javascript", "typescript", "python",
          "rust", "go", "json", "yaml", "toml", "html", "css", "markdown",
          "bash", "c", "cpp"
        },
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },

  -- Fuzzy finder
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('telescope').setup({
        defaults = {
          file_ignore_patterns = { 
            "node_modules", 
            ".git/", 
            "dist", 
            "build" 
          },
        }
      })
    end
  },
  
  -- LSP Configuration
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    dependencies = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-path'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-nvim-lua'},
      {'saadparwaiz1/cmp_luasnip'},

      -- Snippets
      {'L3MON4D3/LuaSnip'},
      {'rafamadriz/friendly-snippets'},
    },
    config = function()
      local lsp_zero = require('lsp-zero')
      
      lsp_zero.on_attach(function(client, bufnr)
        -- see :help lsp-zero-keybindings
        lsp_zero.default_keymaps({buffer = bufnr})
      end)

      -- Mason setup
      require('mason').setup({})
      require('mason-lspconfig').setup({
        handlers = {
          lsp_zero.default_setup,
        },
      })

      -- nvim-cmp setup
      local cmp = require('cmp')
      local luasnip = require('luasnip')
      require('luasnip.loaders.from_vscode').lazy_load()
      
      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
          ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { 'i', 's' }),
          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { 'i', 's' }),
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'buffer' },
          { name = 'path' },
        }),
      })
    end
  },
  
  -- Autopairs
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = true,
  },
  
  -- Comment
  {
    'numToStr/Comment.nvim',
    opts = {},
    lazy = false,
  },
  
  -- Statusline
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup({
        options = {
          theme = 'auto',
          component_separators = { left = '', right = ''},
          section_separators = { left = '', right = ''},
        }
      })
    end
  },
  
  -- Terminal integration
  {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = true
  },
  
  -- Git integration
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end
  },
  
  -- Indentation guides
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {}
  },
  
  -- Which key (shows keybindings)
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {}
  },

  -- Additional language support can be added here
})
