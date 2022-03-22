--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
lvim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = "material"

-- lvim.lsp.diagnostics.virtual_text = true

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"

-- lvim.keys.

-- lvim.keys.normal_mode["gr"] = false
-- lvim.keys.normal_mode["gd"] = false

-- vim.api.nvim_set_keymap('n', 'gr',  [[<Cmd>lua require('telescope.builtin').lsp_references()<CR>]], { noremap = true})
-- vim.api.nvim_set_keymap('n', 'gd',  [[<Cmd>lua require('telescope.builtin').lsp_definitions()<CR>]], { noremap = true})

lvim.keys.normal_mode = {
  -- ["<C-d>"] = "",
  ["<Tab>"] = ":bnext<CR>",
  -- ["gr"] = "<cmd>Telescope lsp_references<CR>",
  -- ["gd"] = "<cmd>Telescope lsp_definitions<CR>"
-- lvim.keys.normal_mode["gr"] = "<cmd>Telescope lsp_references<CR>"
}
lvim.keys.normal_mode["B"] = "^"
lvim.keys.normal_mode["W"] = "$"

-- lvim.lsp.buffer_mappings.normal_mode["gr"] = { "<cmd>lua require('nvim-telescope/telescope.nvim').lsp_references()<CR>", "References(lsp)" }
lvim.lsp.buffer_mappings.normal_mode["gr"] = { "<cmd>Telescope lsp_references<CR>", "References(lsp)" }

-- lvim.keys.
-- unmap a default keym:apping
-- lvim.keys.normal_mode["<C-Up>"] = false
-- edit a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>"

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
-- local _, actions = pcall(require, "telescope.actions")
-- lvim.builtin.telescope.defaults.mappings = {
--   -- for input mode
--   i = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--     ["<C-n>"] = actions.cycle_history_next,
--     ["<C-p>"] = actions.cycle_history_prev,
--   },
--   -- for normal mode
--   n = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--   },
-- }



-- lvim.keys.normal_mode["<leader>d"] = "<cmd>lua require('nvim-tree-docs.internal').doc_node_at_cursor()<CR>"




-- Use which-key to add extra bindings with the leader-key prefix
lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
-- lvim.builtin.which_key.mappings["d"] = {
--   name = {"+Docs"},
--   d = {"<cmd>nvim-tree-docs document_node_at_cursor<CR>", "Document"}
-- }
lvim.builtin.which_key.mappings["t"] = {
  name = "+Telescope",
  t = {"<cmd>Telescope live_grep<CR>", "find in path"},
  f = {"<cmd>Telescope find_files<CR>", "find file"},
  a = {"<cmd>Telescope treesitter<CR>", "show all symbols"},
  d = {"<cmd>Telescope lsp_definitions<CR>", "show definitions"},
  r = {"<cmd>Telescope lsp_references<CR>", "show references"}
}

-- lvim.builtin.which_key.mappings["g"] = {
--   d = {"<cmd>Telescope lsp_definitions<CR>", "show definitions"},
--   r = {"<cmd>Telescope lsp_references<CR>", "show references"}
-- }

-- lvim.builtin.which_key.mappings["t"] = {
--   name = "+Trouble",
--   r = { "<cmd>Trouble lsp_references<cr>", "References" },
--   f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
--   d = { "<cmd>Trouble lsp_document_diagnostics<cr>", "Diagnostics" },
--   q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
--   l = { "<cmd>Trouble loclist<cr>", "LocationList" },
--   w = { "<cmd>Trouble lsp_workspace_diagnostics<cr>", "Diagnostics" },
-- }


-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.dashboard.active = true
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.show_icons.git = 0

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "rust",
  "java",
  "yaml",
}

lvim.plugins = {
  -- {
  --   'nvim-lualine/lualine.nvim',
  --   requires = { 'kyazdani42/nvim-web-devicons', opt = true },
  --   config = function()
  --     require("lualine").setup {
  --       options = {
  --         icons_enabled = true,
  --         theme = 'auto',
  --         component_separators = { left = '', right = ''},
  --         section_separators = { left = '', right = ''},
  --         disabled_filetypes = {},
  --         always_divide_middle = true,
  --       },
  --       sections = {
  --         lualine_a = {'mode'},
  --         lualine_b = {'branch', 'diff', 'diagnostics'},
  --         lualine_c = {'filename'},
  --         lualine_x = {'encoding', 'fileformat', 'filetype'},
  --         lualine_y = {'progress'},
  --         lualine_z = {'location'}
  --       },
  --       inactive_sections = {
  --         lualine_a = {},
  --         lualine_b = {},
  --         lualine_c = {'filename'},
  --         lualine_x = {'location'},
  --         lualine_y = {},
  --         lualine_z = {}
  --       },
  --       tabline = {},
  --       extensions = {}
  --     }
  --   end
  -- },
  {"folke/tokyonight.nvim"},
  {
    "marko-cerovac/material.nvim",
    config = function()
      require("material").setup({
        custom_highlights = {
          -- Function = { fg = "#00FF00", bg = "#FF0000", gui = "bold" }
        }
      })
    end
  },
  {"glepnir/oceanic-material"},
  {"mhartington/oceanic-next"},
  {"kkoomen/vim-doge"},
  -- {"nvim-treesitter/nvim-tree-docs"},
  -- {"nvim-treesitter/nvim-tree-docs",
  --   config = function()
  --     require("nvim-treesitter.configs").setup {
  --       tree_docs = {
  --         enable = true,
  --         keymap = {
  --           document_node_at_cursor = "<leader>d"
  --         }
  --       },
  --   }
  --   end
  -- },
{"xolox/vim-misc"},
{
  "xolox/vim-notes"
},
{
  "folke/trouble.nvim",
  requires = "kyazdani42/nvim-web-devicons",
  config = function()
    require("trouble").setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  end
},
{
        "ray-x/lsp_signature.nvim",
        config = function() require"lsp_signature".on_attach() end,
        event = "BufRead"
    }

}

-- require('lualine').setup {
--   options = {
--     icons_enabled = true,
--     theme = 'auto',
--     component_separators = { left = '', right = ''},
--     section_separators = { left = '', right = ''},
--     disabled_filetypes = {},
--     always_divide_middle = true,
--   },
--   sections = {
--     lualine_a = {'mode'},
--     lualine_b = {'branch', 'diff', 'diagnostics'},
--     lualine_c = {'filename'},
--     lualine_x = {'encoding', 'fileformat', 'filetype'},
--     lualine_y = {'progress'},
--     lualine_z = {'location'}
--   },
--   inactive_sections = {
--     lualine_a = {},
--     lualine_b = {},
--     lualine_c = {'filename'},
--     lualine_x = {'location'},
--     lualine_y = {},
--     lualine_z = {}
--   },
--   tabline = {},
--   extensions = {}
-- }

-- Lua
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true
lvim.lsp.diagnostics.virtual_text = true

vim.g.material_style = "oceanic"

local components = require("lvim.core.lualine.components")
lvim.builtin.lualine.sections.lualine_a = {"mode"}
lvim.builtin.lualine.sections.lualine_b = {components.branch, components.diff, components.diagnostics}
lvim.builtin.lualine.sections.lualine_c = {components.filename}
lvim.builtin.lualine.sections.lualine_x = {components.encoding, "fileformat", components.filetype}
lvim.builtin.lualine.sections.lualine_y= {components.progress}
lvim.builtin.lualine.sections.lualine_z = {components.location}

lvim.builtin.lualine.tabline = {}
lvim.builtin.lualine.extensions = {}

lvim.builtin.lualine.options = {
  icons_enabled = true,
  theme = "auto",
  component_separators = { left = '', right = ''},
  section_separators = { left = '', right = ''},
  disabled_filetypes = {},
  always_divide_middle = true,
}

-- lvim.builtin.treesitter.autotag
-- generic LSP settings

-- ---@usage disable automatic installation of servers
-- lvim.lsp.automatic_servers_installation = false

-- ---@usage Select which servers should be configured manually. Requires `:LvimCacheReset` to take effect.
-- See the full default list `:lua print(vim.inspect(lvim.lsp.override))`
-- vim.list_extend(lvim.lsp.override, { "pyright" })

-- ---@usage setup a server -- see: https://www.lunarvim.org/languages/#overriding-the-default-configuration
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pylsp", opts)

-- local opts = {noremap=true, silent=true}
-- vim.api.nvim_set_keymap('n', 'gr', '<cmd>Telescope lsp_references<CR>', opts)
-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   -- Enable completion triggered by <c-x><c-o>
--   -- vim.api.nvim_buf_set_keymap(bufnr, 'n', "gd", '<cmd>Telescope lsp_definitions<CR>')
--   vim.api.nvim_buf_set_keymap(bufnr, 'n', "gr", '<cmd>Telescope lsp_references<CR>', opts)

--   -- buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
-- local formatters = require "lvim.lsp.null-ls.formatters"
-- formatters.setup {
--   { command = "black", filetypes = { "python" } },
--   { command = "isort", filetypes = { "python" } },
--   {
--     -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "prettier",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--print-with", "100" },
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "typescript", "typescriptreact" },
--   },
-- }

-- -- set additional linters
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { command = "flake8", filetypes = { "python" } },
--   {
--     -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "shellcheck",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--severity", "warning" },
--   },
--   {
--     command = "codespell",
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "javascript", "python" },
--   },
-- }

-- Additional Plugins
-- lvim.plugins = {
--     {"folke/tokyonight.nvim"},
--     {
--       "folke/trouble.nvim",
--       cmd = "TroubleToggle",
--     },
-- }

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- lvim.autocommands.custom_groups = {
--   { "BufWinEnter", "*.lua", "setlocal ts=8 sw=8" },
-- }

