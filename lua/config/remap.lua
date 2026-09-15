-- preprimeagen basic stuff
vim.opt.number = true
vim.opt.relativenumber = true
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set expandtab")
vim.cmd("set autoindent")
vim.cmd("set smartindent")

---- Make the floating window interior visible
--vim.api.nvim_set_hl(0, "NormalFloat", { link = "Normal" })

-- Make border transparent background but colored line
--vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#888888", bg = "none" })

-- Status bar with relative line numbers and line numbers (and more) from :help statusbar
--vim.cmd([[
--let &stc = '%#NonText#%{&nu?v:lnum:""}' .
--      \ '%=%{&rnu&&(v:lnum%2)?"\ ".v:relnum:""}' .
--      \ '%#LineNr#%{&rnu&&!(v:lnum%2)?"\ ".v:relnum:""}'
--]])

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.updatetime = 50
--vim.opt.colorcolumn = "80"
vim.opt.mouse = ""

vim.g.mapleader= " "
vim.g.maplocalleader = "\\"

-- Map Ctrl-Backspace to delete the previous word in insert mode.
-- solution: https://vim.fandom.com/wiki/Map_Ctrl-Backspace_to_delete_previous_word
vim.keymap.set({ "i", "c" }, "<C-BS>", "<C-w>", { noremap = true })
vim.keymap.set({ "i", "c" }, "<C-h>", "<C-w>", { noremap = true })

-- Rounded border on floating windows
vim.opt.winborder = "rounded"

-- primeagen useful keymaps
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex) -- enter Netrw directory

-- allows similar functionality as alt + up/down arrow key in VSCode, but while in visual mode using J or K. Has some issues like not allowing a [count] or producing an error when you try to move below the file but that's fine.
vim.keymap.set('v', "J", ":m '>+1<CR>gv=gv")
vim.keymap.set('v', "K", ":m '<-2<CR>gv=gv")

--vim.keymap.set("n", "J", "mzJ`z") -- when doing J, it keeps your cursor where it is rather than moving it to the space joining them

-- makes <C-d> and <C-u> place the cursor in the middle
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- makes searching with "/" show results in the middle rather than anywhere, with this and the above 2 you have to decide whether this is actually what you want it seems to be just some ocd thing with primeagen but do some coding and see what you want
--vim.keymap.set("n", "n", "nzzzv")
--vim.keymap.set("n", "N", "Nzzzv")

-- very specific paste operator that allows you to paste over something without losing your old paste
vim.keymap.set("x", "<leader>p", "\"_dP")

-- basically does the same as "+ register before yank but with leader
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- same as above but with delete instead
vim.keymap.set("n", "<leader>d", "\"+d")
vim.keymap.set("v", "<leader>d", "\"+d")


-- i stoped doing the rest of Primeagen's remaps because I haven't encountered the problems yet or used it enough to want them but consider checking them out later.

-- LSP Remaps


-- LSP keymaps (applied when any LSP attaches)
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local bufnr = args.buf
    local opts = { noremap = true, silent = true, buffer = bufnr }

    -- LSP basics
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, opts) -- insert mode, parameter hints

    -- Actions
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "<leader>f", function()
      vim.lsp.buf.format { async = true }
    end, opts)

    -- Diagnostics
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
    vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)
    vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, opts)
  end,
})


-- Plugin Remaps (global, not tied to LSP)
vim.keymap.set("n", "<leader>th", "<cmd>ThemeHub<cr>", { desc = "Open ThemeHub" })
vim.keymap.set("n", "<leader>tt", "<cmd>TransparentToggle<cr>", { desc = "Toggle theme transparency" })

-- Plugin Remaps:
-- ThemeHub

vim.keymap.set("n", "<leader>th", "<cmd>ThemeHub<cr>", { desc = "Open ThemeHub" })

-- Transparent.nvim
vim.keymap.set("n", "<leader>tt", "<cmd>TransparentToggle<cr>", { desc = "Toggle theme transparency" })










-- Temp
--vim.filetype.add({
--    pattern = { [".*/hypr/.*%.conf"] = "hyprlang" }
--})
vim.filetype.add({
  extension = {
    asm = 'nasm',
    --s = 'nasm',
  },
})
vim.opt.runtimepath:append("/home/unreal/.local/share/nvim/site")


-- temp delete after it is introduced eventually, it seems to be nice tho
require('vim._core.ui2').enable()
