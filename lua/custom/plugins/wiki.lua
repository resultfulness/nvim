return {
	'serenevoid/kiwi.nvim',
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {
		{
			name = "notes",
			path = vim.fn.expand('~/personal/notes')
		},
	},
	keys = {
		{
			"<leader>ww",
			":lua require(\"kiwi\").open_wiki_index()<cr>",
			desc = "Wiki: Open Wiki index"
		},
		{
			"<leader>wd",
			":lua require(\"kiwi\").open_diary_index()<cr>",
			desc = "Wiki: Open Diary index"
		},
		{
			"<leader>wn",
			":lua require(\"kiwi\").open_diary_new()<cr>",
			desc = "Wiki: Open today's Diary"
		},
		{
			"<leader>wt",
			":lua require(\"kiwi\").todo.toggle()<cr>",
			desc = "Wiki: Toggle Markdown Task"
		}
	},
	lazy = true
}
