return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  lazy = false,
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = { "lua", "bash" },
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true }
    })
  end
}
