return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'hrsh7th/nvim-cmp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-nvim-lsp',
      'L3MON4D3/LuaSnip',
    },
    config = function()
      require('mason').setup()


      require('mason-lspconfig').setup({
        ensure_installed = { 'pyright', 'lua_ls', 'vimls' , 'clangd'},
      })

      -- 1. Setup Autocompletion (nvim-cmp)
      local cmp = require('cmp')
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      
      cmp.setup({

	preselect = cmp.PreselectMode.None,
	completion = {
	    completeopt = 'menu, menuone, noinsert, noselect',
	},
        snippet = { expand = function(args) require('luasnip').lsp_expand(args.body) end },
        mapping = cmp.mapping.preset.insert({
          ['<C-Space>'] = cmp.mapping.complete(),

          ['<CR>'] = cmp.mapping.confirm({ select = false }),
          ['<Tab>'] = cmp.mapping.select_next_item(),
          ['<S-Tab>'] = cmp.mapping.select_prev_item(),
        }),
        sources = cmp.config.sources({{ name = 'nvim_lsp' }, { name = 'luasnip' }})
      })

      -- 2. New Native LSP Setup (Neovim 0.11+)
      -- This applies your CMP capabilities to ALL servers globally
      vim.lsp.config("*", { capabilities = capabilities })

      -- 3. Enable the servers
      vim.lsp.enable({ 'pyright', 'lua_ls', 'vimls', 'clangd'})

      -- 4. Set up Python/Lua specific overrides
      vim.lsp.config('lua_ls', {
        settings = {
          Lua = {
            diagnostics = { globals = { 'vim' } },
            workspace = { checkThirdParty = false },
          },
        },
      })
    end,
  }
}
