vim.g.mapleader = " "
vim.keymap.set("n", "<leader>cd", vim.cmd.Ex)
-- Create a group so the autocommands don't duplicate on reload
local lsp_group = vim.api.nvim_create_augroup('UserLspConfig', { clear = true })

vim.api.nvim_create_autocmd('LspAttach', {
  group = lsp_group,
  callback = function(args)
    local opts = { buffer = args.buf }
    
    -- Set the keybindings
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K',  vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)

    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
    
    -- Enable the new native autocomplete (NVIM 0.11+)
    -- vim.lsp.completion.enable(true, args.data.client_id, args.buf, { autotrigger = true })
  end,
})
