return {
    'nvim-treesitter/nvim-treesitter',
    build = ":TSUpdate",
    config = function()
        -- Use the new simplified require according to the docs
        require('nvim-treesitter').setup({
            highlight = {
                enable = true
            },
            indent = { enable = true },
            ensure_installed = { "lua", }, 
            auto_install = false,
	    
        })
    end
}
