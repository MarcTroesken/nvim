require'lspconfig'.dockerls.setup{}
require'lspconfig'.tsserver.setup{}
require'lspconfig'.intelephense.setup{}
require'lspconfig'.bashls.setup{}
require'lspconfig'.terraformls.setup{}

require('lualine').setup {
  options = {
    theme = 'onedark',
  }
}
