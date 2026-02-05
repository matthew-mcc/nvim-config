local function enable_transparency()
    vim.api.nvim_set_hl(0, "Normal", {bg = "none"})
end

return {
    {
	-- "folke/tokyonight.nvim",
	"Mofiqul/dracula.nvim",
	config = function()
	    vim.cmd.colorscheme "dracula"
	    -- vim.cmd.colorscheme "tokyonight"
	    enable_transparency()
	end
    },

    {
	"nvim-lualine/lualine.nvim",
	dependencies = {
	    "nvim-tree/nvim-web-devicons",
	},
	opts = {
	    theme = 'dracula',
	}

    }
}
