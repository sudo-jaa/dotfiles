lvim.log.level = "warn"
lvim.format_on_save = true
vim.o.termguicolors = true;

lvim.colorscheme = "material"
lvim.leader = "space"
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"

lvim.keys.normal_mode = {
  ["<Tab>"] = ":bnext<CR>",
}
lvim.keys.normal_mode["B"] = "^"
lvim.keys.normal_mode["W"] = "$"
lvim.keys.normal_mode["P"] = "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>"

lvim.lsp.buffer_mappings.normal_mode["gr"] = { "<cmd>Telescope lsp_references<CR>", "References(lsp)" }

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

lvim.builtin.which_key.mappings["-"] = {
  a = { "<cmd>Telescope quickfix<CR>", "Code Action" }
}

lvim.builtin.which_key.mappings["m"] = { "<cmd>Telescope marks<CR>", "marks" }
lvim.builtin.which_key.mappings["."] = { "<cmd>Telescope treesitter<CR>", "tags" }
lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings["t"] = {
  name = "+Telescope",
  t = { "<cmd>Telescope live_grep<CR>", "find in path" },
  f = { "<cmd>Telescope find_files<CR>", "find file" },
  a = { "<cmd>Telescope treesitter<CR>", "show all symbols" },
  d = { "<cmd>Telescope lsp_definitions<CR>", "show definitions" },
  r = { "<cmd>Telescope lsp_references<CR>", "show references" }
}

lvim.builtin.which_key.mappings["Z"] = {
  name = "+Zen",
  m = { "<cmd> :ZenMode<CR>", "Toggle Zen" }
}

lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"

lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer = {
  add_trailing = false,
  group_empty = false,
  highlight_git = true,
  full_name = false,
  root_folder_modifier = ":~",
  indent_markers = {
    enable = false,
    icons = {
      corner = "└ ",
      edge = "│ ",
      item = "│ ",
      none = "  ",
    },
  },
  icons = {
    webdev_colors = true,
    git_placement = "before",
    padding = " ",
    symlink_arrow = " ➛ ",
    show = {
      file = true,
      folder = true,
      folder_arrow = true,
      git = true,
    },
    glyphs = {
      default = "",
      symlink = "",
      folder = {
        arrow_closed = "",
        arrow_open = "",
        default = "",
        open = "",
        empty = "",
        empty_open = "",
        symlink = "",
        symlink_open = "",
      },
      git = {
        unstaged = "✗",
        staged = "✓",
        unmerged = "",
        renamed = "➜",
        untracked = "★",
        deleted = "",
        ignored = "◌",
      },
    },
  },
  special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
}

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
  { "folke/tokyonight.nvim" },
  {
    "marko-cerovac/material.nvim",
    config = function()
      require("material").setup({
        custom_highlights = {}
      })
    end
  },
  { "glepnir/oceanic-material" },
  { "mhartington/oceanic-next" },
  { "kkoomen/vim-doge" },
  { "xolox/vim-misc" },
  { "xolox/vim-notes" },
  -- {"MattesGroeger/vim-bookmarks"},
  -- {"tom-anders/telescope-vim-bookmarks.nvim"},
  {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup {
      }
    end
  },
  {
    "ray-x/lsp_signature.nvim",
    config = function()
      require "lsp_signature".setup()
    end
  },
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  -- {
  --   'wfxr/minimap.vim',
  --   run = "cargo install --locked code-minimap",
  -- },
  {
    -- Plugin for quickly changing parenthesis, brackets and others
    "tpope/vim-surround",
    keys = { "c", "d", "y" }
  },
  {
    "folke/zen-mode.nvim",
    config = function()
      require("zen-mode").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  },
  {
    "folke/twilight.nvim",
    config = function()
      require("twilight").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  },
  {
    "prettier/vim-prettier"
  },
}

require "lsp_signature".setup()
-- require("telescope").load_extension("vim_bookmarks")

-- local formatters = require "lvim.lsp.null-ls.formatters"
-- formatters.setup { { exe = "prettier", args = { "--print-with", "100" }, }, }

-- vim.g.minimap_width = 10
-- vim.g.minimap_auto_start = 1
-- vim.g.minimap_auto_start_win_enter = 1
-- vim.g.minimap_git_colors = 1
-- vim.g.minimap_highlight_search = 1

-- lvim.builtin.which_key.mappings["+"] = {
--   name = "+FindBookmarks",
--   a = {"<cmd>Telescope marks<CR>", "Show all Bookmarks"},
--   -- t = {"<cmd>Telescope help_tags<CR>", "Show all tags"},
-- }



lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true
lvim.lsp.diagnostics.virtual_text = true

vim.g.material_style = "oceanic"

local components = require("lvim.core.lualine.components")
lvim.builtin.lualine.sections.lualine_a = { "mode" }
lvim.builtin.lualine.sections.lualine_b = { components.branch, components.diff, components.diagnostics }
lvim.builtin.lualine.sections.lualine_c = { components.filename }
lvim.builtin.lualine.sections.lualine_x = { components.encoding, "fileformat", components.filetype }
lvim.builtin.lualine.sections.lualine_y = { components.progress }
lvim.builtin.lualine.sections.lualine_z = { components.location }

lvim.builtin.lualine.tabline = {}
lvim.builtin.lualine.extensions = {}

lvim.builtin.lualine.options = {
  icons_enabled = true,
  theme = "auto",
  component_separators = { left = '', right = '' },
  section_separators = { left = '', right = '' },
  disabled_filetypes = {},
  always_divide_middle = true,
}

-- local logo = {
--   "                                                   &&&&                                               ",
--   "                                                &&&&&&&&&&                                          ",
--   "                                             &&&&&&&&&&&&&&                                         ",
--   "                                          /&&&&&&&&&&&&&&                                           ",
--   "                                        &&&&&&&&&&&&&&&                                             ",
--   "                                     &&&&&&&&&&&&&&&                                                ",
--   "                                   &&&&&&&&&&&&&&&                                                  ",
--   "                                &&&&&&&&&&&&&&&                                                     ",
--   "                              &&&&&&&&&&&&&&        &&                                              ",
--   "                            &&&&&&&&&&&&&&       &&&&&&&                                            ",
--   "                         &&&&&&&&&&&&&&&       &&&&&&&&&&&&                                         ",
--   "                        &&&&&&&&&&&&&&&        &&&&&&&&&&&&&&                                       ",
--   "                           &&&&&&&&&&&&&&        &&&&&&&&&&&&&&&                                    ",
--   "                             &&&&&&&&&&&&&&&        &&&&&&&&&&&&&&                                  ",
--   "                                &&&&&&&&&&&&&&        &&&&&&&&&&&&&&                                ",
--   "                                   &&&&&&&&&&&&&&       &&&&&&&&&&&&&&&                             ",
--   "                                     &&&&&&&&&&&&&&        &&&&&&&&&&&&&&                           ",
--   "                                        &&&&&&&&&&&       &&&&&&&&&&&&&&&                           ",
--   "                                          &&&&&&        &&&&&&&&&&&&&&                              ",
--   "                                                     /&&&&&&&&&&&&&&                                ",
--   "                                                   &&&&&&&&&&&&&&                                   ",
--   "                                                /&&&&&&&&&&&&&                                      ",
--   "                                              &&&&&&&&&&&&&&                                        ",
--   "                                           /&&&&&&&&&&&&&                                           ",
--   "                                         &&&&&&&&&&&&&                                              ",
--   "                                      /&&&&&&&&&&&&&                                                ",
--   "                                       &&&&&&&&&&                                                   ",
--   "                                         &&&&&&                                                     ",
-- }

local logo = {
  "0     1     1     0     1     1     1     0",
  "0     1     1     0     0     1     0     1",
  "0     1     1     0     1     1     1     1",
  "0     1     1     1     0     1     1     0",
  "0     1     1     0     1     0     0     1",
  "0     1     1     0     1     1     0     1",
}


lvim.builtin.alpha.dashboard.section.header.opts.hl = "Comment"
-- lvim.builtin.alpha.dashboard.config.layout = {
--   { type = 'padding', val = 4 },
--   lvim.builtin.alpha.dashboard.section.header,
--   { type = 'padding', val = 4 },
--   lvim.builtin.alpha.dashboard.section.buttons,
--   { type = 'padding', val = 4 },
--   lvim.builtin.alpha.dashboard.section.footer
-- }

lvim.builtin.alpha.dashboard.section.header.val = logo
