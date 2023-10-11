-- Install Lazy if not found
local lazypath = vim.fn.stdpath("data") .. "lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Run Lazy
require("lazy").setup({
  -- Autopairs
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {
      check_ts = true,
      ts_config = {
        lua = { "string" }
      }
    }
  },

  -- Colorizer
  {
    "NvChad/nvim-colorizer.lua",
    lazy = false,
    opts = {}
  },

  -- Comment
  {
    "numToStr/Comment.nvim",
    lazy = false,
    opts = {}
  },

  -- Dressing.nvim
  {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
    opts = {
      input = {
        relative = "editor"
      }
    }
  },

  -- Vim Fugitive
  {
    "tpope/vim-fugitive",
    lazy = false
  },

  -- Lualine
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons"
    },
    lazy = false,
    opts = {}
  },

  -- Surround
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    opts = {}
  },

  -- Plugins with their own config file
  require("fzaman.plugins.cmp"),
  require("fzaman.plugins.colourscheme"),
  require("fzaman.plugins.gitsigns"),
  require("fzaman.plugins.lsp"),
  require("fzaman.plugins.mason"),
  require("fzaman.plugins.nvim-tree"),
  require("fzaman.plugins.telescope"),
  require("fzaman.plugins.treesitter")
}, {
  defaults = {
    lazy = true
  },
  ui = {
    border = "rounded"
  }
})
