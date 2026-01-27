return {
  {
    "neovim/nvim-lspconfig",
    config = function()
--      local lspconfig = require('lspconfig')

      -- universal hotkeys, e.g. "gd" means go to definition for whatever language im using
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(ev)
          local opts = { buffer = ev.buf }
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "K",  vim.lsp.buf.hover, opts)
          vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
          vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        end,
      })

      vim.lsp.config("gopls", {})
      vim.lsp.enable("gopls")

      vim.lsp.config("rust-analyzer", {})
      vim.lsp.enable("rust-analyzer")

      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" }, -- Stop it from complaining about the 'vim' variable
            },
          },
        },
      })
      vim.lsp.enable("lua_ls")
    end,
  },
}
