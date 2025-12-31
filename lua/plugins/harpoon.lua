
return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require("harpoon")

    -- REQUIRED
    harpoon:setup()
    -- REQUIRED

    vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
    -- basic telescope configuration. Want to edit so it shows the harpoon number to the left, like 1 2 etc. or the harpoon keybind?
    local conf = require("telescope.config").values
    local function toggle_telescope(harpoon_files)
        local file_paths = {}
        for _, item in ipairs(harpoon_files.items) do
            table.insert(file_paths, item.value)
        end

        require("telescope.pickers").new({}, {
            prompt_title = "Harpoon",
            finder = require("telescope.finders").new_table({
                results = file_paths,
            }),
            previewer = conf.file_previewer({}),
            sorter = conf.generic_sorter({}),
        }):find()
    end

    vim.keymap.set("n", "<C-e>", function() toggle_telescope(harpoon:list()) end,
        { desc = "Open harpoon window" })

    -- alternative to telescope configuration shown above
    --vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

    --vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
    --vim.keymap.set("n", "<C-t>", function() harpoon:list():select(2) end)
    --vim.keymap.set("n", "<C-n>", function() harpoon:list():select(3) end)
    --vim.keymap.set("n", "<C-s>", function() harpoon:list():select(4) end)

    -- Set up <leader>i keybinds for 1 to 9. This can be changed later if I want these keybinds for something else
    for i = 1, 9 do
        vim.keymap.set("n", "<leader>" .. i, function() harpoon:list():select(i) end)
    end

    -- Toggle previous & next buffers stored within Harpoon list
    vim.keymap.set("n", "<leader><", function() harpoon:list():prev() end)
    vim.keymap.set("n", "<leader>>", function() harpoon:list():next() end)

  end,
}
