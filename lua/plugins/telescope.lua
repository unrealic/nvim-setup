return {
  "nvim-telescope/telescope.nvim",
  tag = "v0.1.9",
  dependencies = { "nvim-lua/plenary.nvim", "BurntSushi/ripgrep", { "nvim-telescope/telescope-fzf-native.nvim", build = "make" } },
  config = function()
    local builtin = require("telescope.builtin")

    -- Keymaps
    vim.keymap.set("n", "<C-p>", builtin.find_files, {})
    vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})

    -- Optional: enable git file search when you start using Git
    -- vim.keymap.set("n", "<leader>gf", builtin.git_files, {})
  end,
}
