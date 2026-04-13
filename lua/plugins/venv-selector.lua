return {
  {
    "linux-cultist/venv-selector.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "nvim-telescope/telescope.nvim",
      "mfussenegger/nvim-dap-python", -- optional for debugging support
    },
    opts = {
      -- Options go here; see the plugin's README for full list
      name = ".venv", -- Name of your virtual environment folder
      auto_refresh = true,
    },
    event = "VeryLazy", -- Loads the plugin on startup
    keys = {
      -- Keymap to open the picker and select a virtual environment
      { "<leader>vs", "<cmd>VenvSelect<cr>", desc = "Select VirtualEnv" },
      -- Keymap to retrieve the last used venv for the current directory
      { "<leader>vc", "<cmd>VenvSelectCached<cr>", desc = "Select Cached VirtualEnv" },
    },
  },
}
