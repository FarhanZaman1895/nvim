return {
  "williamboman/mason.nvim",
  lazy = false,
  dependencies = {
    "williamboman/mason-lspconfig.nvim"
  },
  config = function()
    require("mason").setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗"
        },
        border = "rounded",
        width = 0.7,
        height = 0.8
      }
    })

    require("mason-lspconfig").setup({
      ensure_installed = {
        "lua_ls",
        "pyright"
      }
    })
  end
}
