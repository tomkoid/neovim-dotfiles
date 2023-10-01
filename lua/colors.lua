local api = vim.api
local cmd = vim.cmd

local function rembackground(color)
	color = color or "catppuccin"
	cmd.colorscheme(color)

	api.nvim_set_hl(0, "Normal", { bg = "none" })
	api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

local function customize_colors()
	cmd([[hi NvimTreeNormal guibg=NONE ctermbg=NONE]])

	api.nvim_set_hl(0, "LineNrAbove", { fg = "#bac2de" })
	api.nvim_set_hl(0, "LineNr", { fg = "#cdd6f4" })
	api.nvim_set_hl(0, "LineNrBelow", { fg = "#a6adc8" })
end

rembackground()
customize_colors()
