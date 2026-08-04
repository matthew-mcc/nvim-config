return {
  'akinsho/toggleterm.nvim',
  version = "*",
  config = function()
    require("toggleterm").setup({
      size = 20,
      open_mapping = [[<c-\>]], -- Shortcut to toggle
      hide_numbers = true,
      shade_terminals = false,
      shading_factor = 2,
      start_in_insert = true,
      insert_mappings = true,
      persist_size = true,
      direction = 'float', -- 'vertical' | 'horizontal' | 'window' | 'float'
      close_on_exit = true,
      shell = "fish",
      float_opts = {
        border = 'curved',
        winblend = 0,
      },
      -- Override highlights specifically for toggleterm windows
      highlights = {
        NormalFloat = {
          guibg = "#000000",
        },
        FloatBorder = {
          guibg = "#000000",
        },
      },
    })

    -- Terminal Keybindings
    function _G.set_terminal_keymaps()
      local opts = {buffer = 0}
      vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
      vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
      vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
      vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
      vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
      vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
    end

    vim.api.nvim_create_autocmd('TermOpen', {
      pattern = 'term://*',
      callback = function()
        set_terminal_keymaps()
      end
    })

  end
}
-- return {
--   'akinsho/toggleterm.nvim',
--   version = "*",
--   config = function()
--     require("toggleterm").setup({
--       size = 20,
--       open_mapping = [[<c-\>]], -- Shortcut to toggle
--       hide_numbers = true,
--       shade_terminals = true,
--       shading_factor = 2,
--       start_in_insert = true,
--       insert_mappings = true,
--       persist_size = true,
--       direction = 'float', -- 'vertical' | 'horizontal' | 'window' | 'float'
--       close_on_exit = true,
--       shell = "fish",
--       float_opts = {
--         border = 'curved',
--         winblend = 3,
--       },
--     })
--
--     -- Terminal Keybindings
--     -- These allow you to navigate out of the terminal easily
--     function _G.set_terminal_keymaps()
--       local opts = {buffer = 0}
--       vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
--       vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
--       vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
--       vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
--       vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
--       vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
--     end
--
--     -- Apply the mappings when a terminal opens
--     vim.api.nvim_create_autocmd('TermOpen', {
--       pattern = 'term://*',
--       callback = function()
--         set_terminal_keymaps()
--       end
--     })
--
--     -- Optional: Custom Python Toggle Keybind (<leader>py)
--     local Terminal = require('toggleterm.terminal').Terminal
--     local python = Terminal:new({ cmd = "python3", hidden = true })
--
--     vim.keymap.set("n", "<leader>py", function()
--       python:toggle()
--     end, { desc = "Python REPL" })
--   end
-- }
