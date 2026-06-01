return {
	{
		'danymat/neogen',

		-- version = 'v0.*',

		opts = {
      noremap = true,
      silent = true,
		},
    config = function()
      require("neogen").setup {}
      vim.keymap.set("n", "<Leader>nc", ":lua require('neogen').generate({ type = 'class' })<CR>", opts)
      vim.keymap.set("n", "<Leader>nf", ":lua require('neogen').generate({ type = 'func' })<CR>", opts)
    end,
	},
}
