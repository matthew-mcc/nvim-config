return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup({
      view = {
        width = 30,
        side = "left",
      },
      filters = {
        dotfiles = false, -- show hidden files
      },
      respect_buf_cwd=true,
    })
    vim.api.nvim_create_autocmd("VimEnter", {
      callback = function()
	local root = vim.fs.root(0, { "Assets", "Packages", "ProjectSettings" })

	-- Only treat as Unity project if ALL exist
	if
	  root
	  and vim.fn.isdirectory(root .. "/Assets") == 1
	  and vim.fn.isdirectory(root .. "/ProjectSettings") == 1
	then
	  vim.cmd("cd " .. root .. "/Assets")
	end
      end,
    })
    vim.api.nvim_create_autocmd("VimEnter", {
      callback = function()
        vim.schedule(function()
          vim.cmd("NvimTreeOpen")
        end)
      end,
    })

    -- Add a keymap to toggle the tree
    -- This makes Space + e (for explorer) open the sidebar
    vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle File Explorer" })
  end,
}
