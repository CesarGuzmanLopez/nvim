return {
   {
      "stevearc/conform.nvim",
      event = "BufWritePre", -- uncomment for format on save
      config = function()
         require "configs.conform"
      end,
   },
   {
      "nvim-treesitter/nvim-treesitter",
      opts = {
         ensure_installed = {
            "vim",
            "lua",
            "vimdoc",
            "html",
            "css",
            "scss",
            "cpp",
         },
      },
   },
   {
      "williamboman/mason.nvim",
      opts = {
         ensure_installed = {
            "lua-language-server",
            "stylua",
            "css-lsp",
            "html-lsp",
            "prettier",
            "eslint-lsp",
            "tailwindcss-language-server",
            "typescript-language-server",
            "angular-language-server",
            "eslint_d",
            "jsonlint",
            "json-lsp",
            "deno",
            "clangd",
            "java-debug-adapter",
            "java-language-server",
            "java-test",
            "gradle-language-server",
            "cpptools",
            "pyright",
            "rust-analyzer",
            "php-cs-fixer",
            "phpactor",
            "intelephense",
            "psalm",
            "bash-language-server",
            "dockerfile-language-server",
            "yaml-language-server",
            "jsonnet-language-server",
            "terraform-ls",
            "gopls",
            "csharp-language-server",
            "python-lsp-server",
            "vue-language-server",
            "svelte-language-server",
            "checkstyle",
            "astro-language-server",
            "css-lsp", -- Podría referirse a cssls
            "html-lsp", -- Podría referirse a html (Asegurarse del servidor exacto)
            "prettier",
            "eslint-lsp", -- Equivalent a eslint
            "tailwindcss-language-server",
            "typescript-language-server", -- Equivalent a tsserver
            "angular-language-server", -- Equivalent a angularls
            "eslint_d",
            "jsonlint",
            "json-lsp", -- Equivalent a jsonls
            "deno",
            "java-debug-adapter",
            "java-language-server", -- Equivalent a jdtls
            "java-test",
            "jdtls",
            "gradle-language-server",
            "cpptools", -- Verificar si esto se refiere a una herramienta específica o a ccls/clangd
            "pyright",
            "rust-analyzer",
            "php-cs-fixer",
            "jdtls", -- Java Language Server
            "phpactor",
            "kotlin-debug-adapter",
            "kotlin-language-server",
            "latexindent",
            "texlab",
            "textlint",
            "deno",
            "pydocstyle",
            "pylyzer",
            "python-lsp-server",
            "pylint",
         },
         registries = {
            "github:nvim-java/mason-registry",
            "github:mason-org/mason-registry",
         },
      },
   },
   {
      "zbirenbaum/copilot.lua",
      event = "InsertEnter",
      opts = {
         suggestion = {
            enable = false,
         },
         panel = {
            enable = false,
         },
      },
   },

   {
      "hrsh7th/nvim-cmp",
      dependencies = {
         {
            "zbirenbaum/copilot-cmp",
            config = function()
               require("copilot_cmp").setup()
            end,
         },
      },
      opts = {
         sources = {
            { name = "copilot", group_index = 1 },
            { name = "nvim_lsp", group_index = 1 },
            { name = "luasnip", group_index = 1 },
            { name = "buffer", group_index = 1 },
            { name = "nvim_lua", group_index = 1 },
            { name = "path", group_index = 1 },
         },
      },
   },

   {
      "github/copilot.vim",
   },
   {
      "startup-nvim/startup.nvim",
      dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
      config = function()
         require("startup").setup {
            telescope = {
               on_config_done = function()
                  require("telescope").load_extension "copilot"
               end,
            },
         }
      end,
   },
   {
      "adalessa/laravel.nvim",
      dependencies = {
         "nvim-telescope/telescope.nvim",
         "tpope/vim-dotenv",
         "MunifTanjim/nui.nvim",
         "nvimtools/none-ls.nvim",
      },
      cmd = { "Sail", "Artisan", "Composer", "Npm", "Yarn", "Laravel" },
      keys = {},
      event = { "VeryLazy" },
      config = true,
   },
   {
      "gbprod/phpactor.nvim",
      dependencies = {
         "nvim-lua/plenary.nvim", -- required to update phpactor
         "neovim/nvim-lspconfig", -- required to automaticly register lsp serveur
      },
      opts = {
         install = {
            path = vim.fn.stdpath "data" .. "/opt/",
            branch = "master",
            bin = vim.fn.stdpath "data" .. "/opt/phpactor/bin/phpactor",
            php_bin = "php",
            composer_bin = "composer",
            git_bin = "git",
            check_on_startup = "none",
         },
         lspconfig = {
            enabled = true,
            options = {},
         },
      },
   },
   {
      "nvim-java/nvim-java",
      lazy = false,
      dependencies = {
         "nvim-java/lua-async-await",
         "nvim-java/nvim-java-core",
         "nvim-java/nvim-java-test",
         "nvim-java/nvim-java-dap",
         "MunifTanjim/nui.nvim",
         "neovim/nvim-lspconfig",
         "mfussenegger/nvim-dap",
         {
            "williamboman/mason.nvim",
            opts = {
               registries = {
                  "github:nvim-java/mason-registry",
                  "github:mason-org/mason-registry",
               },
            },
         },
         {
            "williamboman/mason-lspconfig.nvim",
            opts = {
               handlers = {
                  ["jdtls"] = function()
                     require("java").setup()
                  end,
               },
            },
         },
      },
   },
   {
      "udalov/kotlin-vim",
      ft = "kotlin",
   },
   -- These are some examples, uncomment them if you want to see them work!
   {
      "neovim/nvim-lspconfig",
      config = function()
         require("nvchad.configs.lspconfig").defaults()
         require "configs.lspconfig"
      end,
   },
   {
      "goolord/alpha-nvim",
      dependencies = {
         "nvim-tree/nvim-web-devicons",
         "nvim-lua/plenary.nvim",
      },
      config = function()
         require("alpha").setup(require("alpha.themes.theta").config)
      end,
      lazy = false,
   },
   {
      "gennaro-tedesco/nvim-possession",
      dependencies = {
         "ibhagwan/fzf-lua",
      },
      config = true,
      init = function()
         local possession = require "nvim-possession"
         vim.keymap.set("n", "<leader>sl", function()
            possession.list()
         end, { desc = "session list" })
         vim.keymap.set("n", "<leader>sn", function()
            possession.new()
         end, { desc = "session new" })
         vim.keymap.set("n", "<leader>su", function()
            possession.update()
         end, { desc = "session update" })
         vim.keymap.set("n", "<leader>sd", function()
            possession.delete()
         end, { desc = "session delete" })
      end,
   },
   {
      "toppair/peek.nvim",
      build = "deno task --quiet build:fast",
      keys = {
         {
            "<leader>op",
            function()
               local peek = require "peek"
               if peek.is_open() then
                  peek.close()
               else
                  peek.open()
               end
            end,
            desc = "Peek (Markdown Preview)",
         },
      },
      opts = { theme = "dark", app = "browser" },
   },
   {
      "iamcco/markdown-preview.nvim",
      cmd = { "MarkdownPreview", "MarkdownPreviewStop" },
      lazy = false,
      build = function()
         vim.fn["mkdp#util#install"]()
      end,
      init = function()
         vim.g.mkdp_theme = "dark"
      end,
   },
}
