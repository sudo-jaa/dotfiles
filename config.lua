lvim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = "material"

lvim.leader = "space"
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"

lvim.keys.normal_mode = {
  ["<Tab>"] = ":bnext<CR>",
}
lvim.keys.normal_mode["B"] = "^"
lvim.keys.normal_mode["W"] = "$"
lvim.keys.normal_mode["P"] = "<cmd>lua require'lvim.lsp.handlers'.show_line_diagnostics()<CR>"

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


lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings["t"] = {
  name = "+Telescope",
  t = {"<cmd>Telescope live_grep<CR>", "find in path"},
  f = {"<cmd>Telescope find_files<CR>", "find file"},
  a = {"<cmd>Telescope treesitter<CR>", "show all symbols"},
  d = {"<cmd>Telescope lsp_definitions<CR>", "show definitions"},
  r = {"<cmd>Telescope lsp_references<CR>", "show references"}
}

lvim.builtin.dashboard.active = true
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.show_icons.git = 0

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
  {"folke/tokyonight.nvim"},
  {
    "marko-cerovac/material.nvim",
    config = function()
      require("material").setup({
        custom_highlights = {}
      })
    end
  },
  {"glepnir/oceanic-material"},
  {"mhartington/oceanic-next"},
  {"kkoomen/vim-doge"},
  {"xolox/vim-misc"},
  {"xolox/vim-notes"},
  {"MattesGroeger/vim-bookmarks"},
  {"tom-anders/telescope-vim-bookmarks.nvim"},
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
    config = function() require"lsp_signature".on_attach() end,
    event = "BufRead"
    },
}

require("telescope").load_extension("vim_bookmarks")

lvim.builtin.which_key.mappings["m"] = {
  name = "+FindBookmarks",
  all = {"<cmd>Telescope vim_bookmarks all<CR>", "Show all Bookmarks"},
  this = {"<cmd>Telescope vim_bookmarks current_file<CR>", "Show current file bookmarks"}
}

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

