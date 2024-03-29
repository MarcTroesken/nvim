local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

configs.setup({
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
    "kotlin",
  },

	sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
  auto_install = true,
	ignore_install = { "" }, -- List of parsers to ignore installing
	highlight = {
		enable = true, -- false will disable the whole extension
		disable = { "" }, -- list of language that will be disabled
		additional_vim_regex_highlighting = true,
	},
	autopairs = {
		enable = true,
	},
	indent = { enable = true, disable = { "yaml" } },
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
  autotag = {
		enable = true,
		disable = { "xml" },
	},
})
