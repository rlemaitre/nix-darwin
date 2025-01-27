return {
	"iamcco/markdown-preview.nvim",
	cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
	build = "cd app && yarn install",
	init = function()
		vim.g.mkdp_filetypes = { "markdown" }
	end,
	keys = {
		{ "<leader>lmp", "<cmd>MarkdownPreview<cr>", desc = "Start Markdown Preview" },
		{ "<leader>lms", "<cmd>MarkdownPreviewStop<cr>", desc = "Stop Markdown Preview" },
		{ "<leader>lmt", "<cmd>MarkdownPreviewToggle<cr>", desc = "Toggle Markdown Preview" },
	},
	ft = { "markdown" },
}
