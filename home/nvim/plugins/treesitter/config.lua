require("nvim-treesitter.configs").setup({
	-- Highlight based on treesitter.
	highlight = { enable = true },
	-- Indentation based on treesitter.
	ident = { enable = true },
	-- Incremental selection in the parsed tree.
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "gn",
			node_incremental = "<TAB>",
			node_decremental = "<S-TAB>",
			scope_incremental = false,
		},
	},
	-- Refactor modules.
	refactor = {
		highlight_definitions = {
			enable = true,
			clear_on_cursor_move = true,
		},
		highlight_current_scope = { enable = false },
		smart_rename = {
			enable = true,
			keymaps = {
				smart_rename = "gR",
			},
		},
	},
	-- Manipulate text-objects.
	textobjects = {
		-- Adding text-objects to select operators.
		select = {
			enable = true,
			lookahead = true,
			keymaps = {
				["af"] = { query = "@function.outer", desc = "Select outer part of a function region" },
				["if"] = { query = "@function.inner", desc = "Select inner part of a function region" },
				["ac"] = { query = "@class.outer", desc = "Select outer part of a class region" },
				["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
			},
		},
		-- Swap two text-objects.
		swap = {
			enable = true,
			swap_next = {
				["<Leader>ls"] = { query = "@parameter.inner", desc = "Swap with the next parameter" },
			},
			swap_previous = {
				["<Leader>lS"] = { query = "@parameter.inner", desc = "Swap with the previous parameter" },
			},
		},
		-- Move around text-objects.
		move = {
			enable = true,
			set_jumps = true,
			goto_next_start = {
				["]m"] = "@function.outer",
				["]]"] = { query = "@class.outer", desc = "Next class start" },
			},
			goto_next_end = {
				["]M"] = "@function.outer",
				["]["] = "@class.outer",
			},
			goto_previous_start = {
				["[m"] = "@function.outer",
				["[["] = "@class.outer",
			},
			goto_previous_end = {
				["[M"] = "@function.outer",
				["[]"] = "@class.outer",
			},
		},
		-- Peek definition code using built-in LSP.
		lsp_interop = {
			enable = true,
			peek_definition_code = {
				["<Leader>lf"] = { query = "@function.outer", desc = "Show function definition" },
				["<Leader>lc"] = { query = "@class.outer", desc = "Show class definition" },
			},
		},
	},
})

-- Use treesitter expressions for folds.
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
