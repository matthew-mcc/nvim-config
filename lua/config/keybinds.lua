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

    vim.keymap.set('n', 'gl', vim.diagnostic.open_float)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
    -- Open a terminal at the bottom with 10 lines of height
    vim.keymap.set('n', '<leader>tt', ':botright split | term<CR>a', { desc = 'Open Terminal' })

  end,
})
