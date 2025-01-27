local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{ import = "rlemaitre.plugins" },
	{ import = "rlemaitre.plugins.ai" },
	{ import = "rlemaitre.plugins.completion" },
	{ import = "rlemaitre.plugins.git" },
	{ import = "rlemaitre.plugins.keybinding" },
	{ import = "rlemaitre.plugins.languages" },
	{ import = "rlemaitre.plugins.languages.markdown" },
	{ import = "rlemaitre.plugins.languages.scala" },
	{ import = "rlemaitre.plugins.lsp" },
	{ import = "rlemaitre.plugins.notes" },
	{ import = "rlemaitre.plugins.projects" },
	{ import = "rlemaitre.plugins.startup" },
	{ import = "rlemaitre.plugins.terminal" },
	{ import = "rlemaitre.plugins.text" },
	{ import = "rlemaitre.plugins.ui" },
}, {
	checker = {
		enabled = true,
		notify = false,
	},
	change_detection = {
		notify = false,
	},
})
