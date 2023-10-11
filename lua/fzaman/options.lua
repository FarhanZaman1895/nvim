-- Neovim Options Table
local options = {
  -- Line Numbers
  number = true,
  relativenumber = true,

  -- Language Agnostic Tab Settings
  expandtab = true,
  autoindent = true,
  smartindent = true,

  -- Default Tab Size
  tabstop = 4,
  shiftwidth = 4,

  -- Search Settings
  ignorecase = true,
  smartcase = true,
  hlsearch = true,
  incsearch = true,

  -- Appearance
  cursorline = true,
  termguicolors = true,
  background = "dark",
  signcolumn = "yes",

  -- Backups and Swaps
  backup = false,
  swapfile = false,
  undofile = true,

  -- Update Times
  timeout = true,
  timeoutlen = 500,
  updatetime = 300,

  -- Splits
  splitbelow = true,
  splitright = true,

  -- Other
  mouse = 'a',
  laststatus = 3,
  showmode = false,
  scrolloff = 8,
  wrap = false
}

for i, j in pairs(options) do
  vim.opt[i] = j
end
