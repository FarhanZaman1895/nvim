return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    "HiPhish/nvim-ts-rainbow2"
  },
  build = ":TSUpdate",
  lazy = false,
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = { "lua", "bash" },
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
      rainbow = {
        enable = true,
        query = "rainbow-parens",
        strategy = require("ts-rainbow").strategy.global
      }
    })
  end
}
