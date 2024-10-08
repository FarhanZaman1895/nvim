return {
  "lewis6991/gitsigns.nvim",
  lazy = false,
  opts = {
    signs = {
      add = { text = "▎" },
      change = { text = "▎" },
      delete = { text = "▎" },
      topdelete = { text = "▎" },
      changedelete = { text = "▎" }
    },
    preview_config = {
      border = "rounded",
      style = "minimal",
      relative = "editor",
    }
  }
}
