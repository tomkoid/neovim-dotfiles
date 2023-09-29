local lspsaga = require("lspsaga")

lspsaga.setup({
	use_saga_diagnostic_sign = true,

	-- diagnostic sign
	error_sign = "x",
	warn_sign = "",
	hint_sign = "",
	infor_sign = "",
	diagnostic_header_icon = "   ",

	-- code action title icon
	code_action_icon = " ",
	code_action = {
		enable = true,
	},

	-- enable symbol highlight
	code_action_prompt = {
		enable = true,
		sign = true,
		sign_priority = 20,
		virtual_text = true,
	},

	server_filetype_map = {},
	diagnostic_prefix_format = "%d. ",
	diagnostic_message_format = "%m %c",
	highlight_prefix = false,
})

require("lspsaga.symbol.winbar").get_bar()
