lvim.log.level = "warn"
lvim.format_on_save = false
vim.o.termguicolors = true;

lvim.colorscheme = "material"
vim.g.sonokai_style = "atlantis"

lvim.leader = "space"
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"

lvim.keys.normal_mode = {
  ["<Tab>"] = ":bnext<CR>",
}
lvim.keys.normal_mode["B"] = "^"
lvim.keys.normal_mode["W"] = "$"
lvim.keys.normal_mode["P"] = "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>"

lvim.keys.normal_mode[":W"] = ":w<cr>"

lvim.lsp.buffer_mappings.normal_mode["gr"] = { "<cmd>Telescope lsp_references<CR>", "References(lsp)" }
lvim.lsp.buffer_mappings.normal_mode["gI"] = { "<cmd>Telescope lsp_implementations<CR>", "Implementations(lsp)" }

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

vim.o.scrolloff = 999

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

lvim.builtin.which_key.mappings["z"] = {
  name = "+Zen",
  m = { "<cmd> :ZenMode<CR>", "Toggle Zen" }
}

lvim.keys.normal_mode["<leader>+"] = "<cmd>Telescope buffers<CR>"

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
      }
    }
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
        custom_highlights = {},
        contrast = {
          sidebars = true, -- Enable contrast for sidebar-like windows ( for example Nvim-Tree )
          floating_windows = true, -- Enable contrast for floating windows
          line_numbers = true, -- Enable contrast background for line numbers
          sign_column = true, -- Enable contrast background for the sign column
          cursor_line = true, -- Enable darker background for the cursor line
          non_current_windows = true, -- Enable darker background for non-current windows
          popup_menu = true, -- Enable lighter background for the popup menu
        },
      })
    end
  },
  {
    "sainnhe/sonokai",
  },
  { "sainnhe/gruvbox-material" },
  { "glepnir/oceanic-material" },
  { "mhartington/oceanic-next" },
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
    -- keys = { "c", "d", "y" }
  },
  {
    'wellle/targets.vim'
  },
  {
    "folke/zen-mode.nvim",
    config = function()
      require("zen-mode").setup {
        window = {
          width = 120,
          height = 1
        }
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
  -- {
  --   "ggandor/lightspeed.nvim"
  -- },
  {
    "ggandor/leap.nvim"
  },
  {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  },
  {
    "simrat39/rust-tools.nvim",
    config = function()
      local lsp_installer_servers = require "nvim-lsp-installer.servers"
      local _, requested_server = lsp_installer_servers.get_server "rust_analyzer"
      require("rust-tools").setup({
        tools = {
          autoSetHints = true,
          hover_with_actions = true,
          runnables = {
            use_telescope = true,
          },
        },
        server = {
          cmd_env = requested_server._default_options.cmd_env,
          on_attach = require("lvim.lsp").common_on_attach,
          on_init = require("lvim.lsp").common_on_init,
        },
      })
    end,
    ft = { "rust", "rs" },
  },
  {
    "rcarriga/nvim-dap-ui"
  },
  {
    "gennaro-tedesco/nvim-peekup"
  },
  {
    'lukas-reineke/indent-blankline.nvim'
  },
  {
    "tpope/vim-fugitive"
  },
  {
    "ludovicchabant/vim-gutentags"
  },
  {
    'quangnguyen30192/cmp-nvim-tags',
  },
  {
    'liuchengxu/vista.vim'
  },
  {
    "axelvc/template-string.nvim"
  },
  {
    'ldelossa/gh.nvim',
    requires = { { 'ldelossa/litee.nvim' } }
  },
  {
    "mcchrish/zenbones.nvim",
    -- Optionally install Lush. Allows for more configuration or extending the colorscheme
    -- If you don't want to install lush, make sure to set g:zenbones_compat = 1
    -- In Vim, compat mode is turned on as Lush only works in Neovim.
    requires = "rktjmp/lush.nvim"
  },
  { "rebelot/kanagawa.nvim" },
  -- {'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async'},
  {
    "danymat/neogen",
    config = function()
      require('neogen').setup {}
    end,
  }
}

require('neogen').setup {
  enabled = true, --if you want to disable Neogen
  input_after_comment = true, -- (default: true) automatic jump (with insert mode) on inserted annotation
  -- jump_map = "<C-e>"       -- (DROPPED SUPPORT, see [here](#cycle-between-annotations) !) The keymap in order to jump in the annotation fields (in insert mode)
}

require('leap').set_default_keymaps()

-- vim.o.foldcolumn = '1'
-- vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
-- vim.o.foldlevelstart = 99
-- vim.o.foldenable = true

-- -- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
-- vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
-- vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)

-- require('ufo').setup({
--     provider_selector = function(bufnr, filetype, buftype)
--         return {'treesitter', 'indent'}
--     end
-- })

require('litee.lib').setup()
require('litee.gh').setup({
  -- deprecated, around for compatability for now.
  jump_mode             = "invoking",
  -- remap the arrow keys to resize any litee.nvim windows.
  map_resize_keys       = false,
  -- do not map any keys inside any gh.nvim buffers.
  disable_keymaps       = false,
  -- the icon set to use.
  icon_set              = "default",
  -- any custom icons to use.
  icon_set_custom       = nil,
  -- whether to register the @username and #issue_number omnifunc completion
  -- in buffers which start with .git/
  git_buffer_completion = true,
  -- defines keymaps in gh.nvim buffers.
  keymaps               = {
    -- when inside a gh.nvim panel, this key will open a node if it has
    -- any futher functionality. for example, hitting <CR> on a commit node
    -- will open the commit's changed files in a new gh.nvim panel.
    open = "<CR>",
    -- when inside a gh.nvim panel, expand a collapsed node
    expand = "zo",
    -- when inside a gh.nvim panel, collpased and expanded node
    collapse = "zc",
    -- when cursor is over a "#1234" formatted issue or PR, open its details
    -- and comments in a new tab.
    goto_issue = "gd",
    -- show any details about a node, typically, this reveals commit messages
    -- and submitted review bodys.
    details = "d",
    -- inside a convo buffer, submit a comment
    submit_comment = "<C-s>",
    -- inside a convo buffer, when your cursor is ontop of a comment, open
    -- up a set of actions that can be performed.
    actions = "<C-a>",
    -- inside a thread convo buffer, resolve the thread.
    resolve_thread = "<C-r>",
    -- inside a gh.nvim panel, if possible, open the node's web URL in your
    -- browser. useful particularily for digging into external failed CI
    -- checks.
    goto_web = "gx"
  }
})

lvim.builtin.which_key.mappings["G"] = {
  name = "+Github",
  c = {
    name = "+Commits",
    c = { "<cmd>GHCloseCommit<cr>", "Close" },
    e = { "<cmd>GHExpandCommit<cr>", "Expand" },
    o = { "<cmd>GHOpenToCommit<cr>", "Open To" },
    p = { "<cmd>GHPopOutCommit<cr>", "Pop Out" },
    z = { "<cmd>GHCollapseCommit<cr>", "Collapse" },
  },
  i = {
    name = "+Issues",
    p = { "<cmd>GHPreviewIssue<cr>", "Preview" },
  },
  l = {
    name = "+Litee",
    t = { "<cmd>LTPanel<cr>", "Toggle Panel" },
  },
  r = {
    name = "+Review",
    b = { "<cmd>GHStartReview<cr>", "Begin" },
    c = { "<cmd>GHCloseReview<cr>", "Close" },
    d = { "<cmd>GHDeleteReview<cr>", "Delete" },
    e = { "<cmd>GHExpandReview<cr>", "Expand" },
    s = { "<cmd>GHSubmitReview<cr>", "Submit" },
    z = { "<cmd>GHCollapseReview<cr>", "Collapse" },
  },
  p = {
    name = "+Pull Request",
    c = { "<cmd>GHClosePR<cr>", "Close" },
    d = { "<cmd>GHPRDetails<cr>", "Details" },
    e = { "<cmd>GHExpandPR<cr>", "Expand" },
    o = { "<cmd>GHOpenPR<cr>", "Open" },
    p = { "<cmd>GHPopOutPR<cr>", "PopOut" },
    r = { "<cmd>GHRefreshPR<cr>", "Refresh" },
    t = { "<cmd>GHOpenToPR<cr>", "Open To" },
    z = { "<cmd>GHCollapsePR<cr>", "Collapse" },
  },
  t = {
    name = "+Threads",
    c = { "<cmd>GHCreateThread<cr>", "Create" },
    n = { "<cmd>GHNextThread<cr>", "Next" },
    t = { "<cmd>GHToggleThread<cr>", "Toggle" },
  },
}

require('template-string').setup({
  filetypes = { 'typescript', 'javascript', 'typescriptreact', 'javascriptreact' }, -- filetypes where the plugin is active
  jsx_brackets = true, -- should add brackets to jsx attributes
})

require('telescope').setup({
  pickers = {
    buffers = {
      theme = "dropdown",
    }
  }
})

require("indent_blankline").setup {
  -- for example, context is off by default, use this to turn it on
  show_current_context = true,
  show_current_context_start = true,
}

lvim.builtin.dap.active = true
require "lsp_signature".setup()
-- require'navigator'.setup()

-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "rust_analyzer" })

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
lvim.builtin.lualine.sections.lualine_c = { { "filename", path = 1 }, "fileformat",
  components.filetype }
lvim.builtin.lualine.sections.lualine_x = {}
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

local logo = {
  "",
  "",
  "",
  "0     1     1     0     1     1     1     0",
  "0     1     1     0     0     1     0     1",
  "0     1     1     0     1     1     1     1",
  "0     1     1     1     0     1     1     0",
  "0     1     1     0     1     0     0     1",
  "0     1     1     0     1     1     0     1",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
}


lvim.builtin.alpha.dashboard.section.header.opts.hl = "Comment"

lvim.builtin.alpha.dashboard.section.header.val = logo

require('material').setup {
  custom_highlights = {
    LineNr = { fg = "#557381" }
  }
}

