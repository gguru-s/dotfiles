return {
	"lukas-reineke/indent-blankline.nvim",
	event = { "BufReadPre", "BufNewFile" },
	main = "ibl",
	config = function()
		local hooks = require("ibl.hooks")
		hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_space_indent_level)
		hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_tab_indent_level)
		hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
			-- vim.api.nvim_set_hl(0, "GScope", { fg = "#404a51" })
			vim.api.nvim_set_hl(0, "GScope", { fg = "#53555a" })
			vim.api.nvim_set_hl(0, "GIndent", { fg = "#26393d" })
		end)

		require("ibl").setup({
			indent = {
				highlight = {
					"GIndent",
				},
				char = "▏", -- This is a slightly thinner char than the default one, check :help ibl.config.indent.char
			},
			scope = {
				show_start = false,
				show_end = false,
				highlight = "GScope",
			},
		})
	end,
	-- indent = { char = "┊" },
	-- indent = { char = "|" },
}
