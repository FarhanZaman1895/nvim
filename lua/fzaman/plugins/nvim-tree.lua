return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons"
  },
  config = function()
    -- Disable Netrw
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    -- Enable Nvim-tree
    require("nvim-tree").setup({
      view = {
        width = 30,
        relativenumber = true
      }
    })

    -- Keymaps
    vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { noremap = true, silent = true })
  end
}
