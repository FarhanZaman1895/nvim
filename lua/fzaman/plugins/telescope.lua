-- Fuzzy Finder
-- Return to Lazy
return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.3",
  dependencies = { 
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons"
  },
  lazy = false,
  config = function()
    -- Local Functions
    local builtin = require("telescope.builtin")
    local opts = { noremap = true, silent = true }
    local actions = require("telescope.actions")

    -- Keymaps
    local picker = require("telescope.themes").get_dropdown()
    vim.keymap.set("n", "<leader>ff", function() builtin.find_files(picker) end, opts)
    vim.keymap.set("n", "<leader>fl", function() builtin.live_grep(picker) end, opts)
    vim.keymap.set("n", "<leader>fb", function() builtin.buffers(picker) end, opts)
    vim.keymap.set("n", "<leader>fg", function() builtin.git_files(picker) end, opts)

    -- Telescope Config
    require("telescope").setup{
      defaults = {
        mappings = {
          i = { 
            -- Insert Mode Mappings
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-c>"] = actions.close,
            ["<C-p>"] = actions.cycle_history_prev,
            ["<C-n>"] = actions.cycle_history_next
          },
          n = {
            -- Normal Mode Mappings
            ["<C-c>"] = actions.close
          }
        }
      }
    }

    -- Telescope Extensions
    require("telescope").load_extension("fzf")
  end
}
