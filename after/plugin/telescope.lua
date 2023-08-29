require("telescope").setup({
	defaults = {
		file_ignore_patterns = {},
		file_previewer = require("telescope.previewers").cat.new,
		sorting_strategy = "ascending",
		path_display = { "absolute" },
		highlight = "TelescopePreviewNormal",
	},
})
