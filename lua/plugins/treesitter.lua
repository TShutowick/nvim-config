return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    -- Note the missing 's' at the end of .config
    require("nvim-treesitter.config").setup({
       ensure_installed = { "markdown", "markdown_inline", "lua", "vim", "go", "perl", "html", "latex", "yaml" },
       highlight = { enable = true },
    })
  end,
}
