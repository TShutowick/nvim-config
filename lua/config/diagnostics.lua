-- Show diagnostic floating window on hover
vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
    local opts = {
      focusable = false,
      close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
      border = 'rounded',
      source = 'always',
      prefix = ' ',
      scope = 'cursor',
    }
    vim.diagnostic.open_float(nil, opts)
  end,
})

-- You might also want to speed up how fast the popup appears 
-- (Default is 4000ms, which is way too slow)
vim.opt.updatetime = 300 -- 300ms
vim.diagnostic.config({
  virtual_text = true, -- Keep the text at the end of the line
  signs = true,        -- Show icons in the gutter
  update_in_insert = false, -- Don't scream at you while you're still typing
  underline = true,
  severity_sort = true,
  float = {
    border = 'rounded',
    source = 'always', -- Shows which LSP sent the error (e.g., "lua_ls" or "gopls")
  },
})
