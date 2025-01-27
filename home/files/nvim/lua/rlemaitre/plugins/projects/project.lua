return {
	"ahmedkhalf/project.nvim",
	keys = {
		{ "<leader>sp", "<cmd>Telescope projects<cr>", desc = "Projects" },
	},
	opts = {
		-- neo-tree integration
		sync_root_with_cwd = true,
		respect_buf_cwd = true,
		update_focused_file = {
			enable = true,
			update_root = true,
		},
		patterns = {
			".git",
			"package.json",
			".terraform",
			"go.mod",
			"requirements.yml",
			"pyrightconfig.json",
			"pyproject.toml",
			"build.sbt",
			"Cargo.toml",
			"pom.xml",
			"gradle.properties",
			"build.gradle",
			"settings.gradle",
			"build.sc",
		},
		-- detection_methods = { "lsp", "pattern" },
		detection_methods = { "lsp", "pattern" },
	},
	config = function(_, opts)
		require("project_nvim").setup(opts)
	end,
}
