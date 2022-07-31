local home = os.getenv("HOME")
local db = require('dashboard')

db.preview_file_height = 5
db.preview_file_width = 39
db.preview_command = "cat | cat"
db.preview_file_path = home .. "/.config/nvim/static/neovim.cat"

db.custom_center = {
	{ desc = 'Open most recently edited files', action = ":browse oldfiles" },
	{ desc = 'Find file', action = ':Telescope find_files find_command=rg,--hidden,--files'},
	{ desc = "Telescope", action = ":Telescope" },
}
