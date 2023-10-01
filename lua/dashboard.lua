local alpha = require("alpha")
local dashboard = require("alpha.themes.startify")
local home = os.getenv("HOME")

-- You can find styles in ~/.config/nvim/static
local style = "pikachu"

local function read_array(file)
	local array = {}
	for line in io.lines(file) do
		table.insert(array, line)
	end
	return array
end

dashboard.section.header.val = read_array(home .. "/.config/nvim/static/" .. style .. ".cat")

alpha.setup(dashboard.config)
