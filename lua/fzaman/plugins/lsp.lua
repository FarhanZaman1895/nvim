return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = { "hrsh7th/cmp-nvim-lsp" },
  config = function()
    -- Local variables
    local opts = { noremap = true, silent = true }
    local lspconfig = require("lspconfig")

    vim.diagnostic.config({
      virtual_text = false,
      float = {
        focusable = false,
        stlye = "minimal",
        border = "rounded",
        source = true,
        header = "",
        prefix = ""
      }
    })

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
      border = "rounded"
    })

    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
      border = "rounded"
    })

    -- Runs when LSP starts
    local on_attach = function(client, bufnr)
      opts.buffer = bufnr
      local keymap = vim.keymap.set
      local telescope = require("telescope.builtin")
      local picker = require("telescope.themes").get_dropdown()

      -- Lsp Keymaps
      keymap("n", "gd", function() telescope.lsp_definitions(picker) end, opts)
      keymap("n", "gD", vim.lsp.buf.declaration, opts)
      keymap("n", "gr", function() telescope.lsp_references(picker) end, opts)
      keymap("n", "K", vim.lsp.buf.hover, opts)
      keymap("n", "gi", function() telescope.lsp_implementations(picker) end, opts)
      keymap("n", "gt", function() telescope.lsp_type_definitions(picker) end, opts)
      keymap("n", "<leader>vl", vim.diagnostic.open_float, opts)
      keymap("n", "<leader>vr", vim.lsp.buf.rename, opts)
      keymap("n", "<leader>vf", function() vim.lsp.buf.format({ async = true }) end, opts)
      keymap("n", "<leader>vs", vim.lsp.buf.signature_help, opts)
      keymap("n", "<leader>vc", vim.lsp.buf.code_action, opts)
      keymap("n", "<leader>vD", function() telescope.diagnostics(picker, { bufnr = 0 }) end, opts)
      keymap("n", "<leader>vn", vim.diagnostic.goto_next, opts)
      keymap("n", "<leader>vp", vim.diagnostic.goto_prev, opts)
    end

    -- Lsp Capabilities
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    -- Diagnostic Signs
    local signs = {
      Error = " ",
      Warn = " ",
      Hint = " ",
      Info = " "
    }

    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    -- Configure Lsp Servers

    -- lua_ls
    lspconfig.lua_ls.setup({
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" }
          },
          workspace = {
            library = {
              [vim.fn.expand("$VIMRUNTIME/lua")] = true,
              [vim.fn.stdpath("config") .. "/lua"] = true
            }
          }
        }
      }
    })

    -- pyright
    lspconfig.pyright.setup({
      capabilities = capabilities,
      on_attach = on_attach
    })

    -- clangd
    lspconfig.clangd.setup({
      capabilities = capabilities,
      on_attach = on_attach
    })

  end
}
