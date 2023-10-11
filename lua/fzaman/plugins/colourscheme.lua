-- Colourscheme, tokyonight
return { 
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("tokyonight").setup({
      style = "moon",
      transparent = true,
      on_highlights = function(hl, c)
        hl.LineNr = { fg = c.dark3 }
        hl.NvimTreeFolderArrowClosed = { fg = c.green }
        hl.NvimTreeFolderArrowOpen = { fg = c.green }
      end
    })

    vim.cmd[[colorscheme tokyonight]]
  end
}
