vim.cmd [[
try
  colorscheme frantic
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]
