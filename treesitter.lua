require'nvim-treesitter.configs'.setup {
  indent = {
    enable = true
  },
  highlight = {
    enable = true
  },
  ensure_installed = {
    "tsx",
    "php",
    "json",
    "javascript",
    "yaml",
    "html",
    "scss",
    "css",
    "bash",
    "hcl",
    "python",
    "vue",
  },
  incremental_selection = {
    enable = true
  },
  textobjects = {
    enable = true
  }
}
