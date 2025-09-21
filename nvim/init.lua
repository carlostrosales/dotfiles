-- =========================
-- Basic Neovim settings
-- =========================
vim.g.mapleader = " "
vim.o.mouse = "a"         -- enable mouse
vim.o.updatetime = 300    -- faster CursorHold for hover
vim.opt.clipboard = "unnamedplus"
vim.opt.mouse = "a"
vim.opt.number = true
vim.opt.relativenumber = true

vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "Save" })
vim.keymap.set("n", "<leader>q", ":q<CR>", { desc = "Quit" })

vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>", { desc = "Toggle Neo-tree" })



-- =========================
-- Bootstrap lazy.nvim
-- =========================
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- =========================
-- Plugins
-- =========================
require("lazy").setup({
  {
    "rebelot/kanagawa.nvim",
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("kanagawa-wave")
    end,
  },
  { "christoomey/vim-tmux-navigator", lazy = false },
  { "neovim/nvim-lspconfig" },
  { "stevearc/conform.nvim" },
  { "nvim-neo-tree/neo-tree.nvim", branch = "v3.x", dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons", "MunifTanjim/nui.nvim"}},
  { "nvim-telescope/telescope.nvim", branch = "0.1.x", dependencies = { "nvim-lua/plenary.nvim" }},
})

-- =========================
-- Unified on_attach for all LSPs
-- =========================
local on_attach = function(_, bufnr)
  -- LSP keymaps
  local map = function(mode, lhs, rhs)
    vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true })
  end
  map("n", "gd", vim.lsp.buf.definition)
  map("n", "gr", vim.lsp.buf.references)
  map("n", "K",  vim.lsp.buf.hover)
  map("n", "<leader>rn", vim.lsp.buf.rename)
  map("n", "<leader>ca", vim.lsp.buf.code_action)

  -- Completion trigger
  vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"

  -- Mouse hover docs on CursorHold
  vim.api.nvim_create_autocmd("CursorHold", {
    buffer = bufnr,
    callback = function()
      vim.lsp.buf.hover()
    end,
  })
end

-- =========================
-- LSP Setup
-- =========================
local lspconfig = require("lspconfig")

-- Python
lspconfig.pyright.setup({
  on_attach = on_attach,
})

-- Python Inlay Type Hints
vim.lsp.inlay_hint.enable(true)

-- Python Inlay Type Hints Not Apart of Page Text Buffer
vim.api.nvim_set_hl(0, "LspInlayHint", { link = "Comment" })



-- TypeScript / React
lspconfig.ts_ls.setup({
  on_attach = on_attach,
  settings = {
    javascript = { format = { enable = false } },
    typescript = { format = { enable = false } },
  },
})

-- =========================
-- Formatter Setup
-- =========================
require("conform").setup({
  formatters_by_ft = {
    typescript        = { "prettier" },
    typescriptreact   = { "prettier" },
    javascript        = { "prettier" },
    javascriptreact   = { "prettier" },
    json              = { "prettier" },
    css               = { "prettier" },
    html              = { "prettier" },
    python            = { "black" },
  },
})

-- Auto format on save
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.ts", "*.tsx", "*.js", "*.jsx", "*.json", "*.css", "*.html", "*.py" },
  callback = function(args)
    require("conform").format({ bufnr = args.buf, lsp_fallback = true })
  end,
})

vim.api.nvim_create_autocmd("InsertEnter", {
  callback = function()
    vim.opt.relativenumber = false
  end,
})
vim.api.nvim_create_autocmd("InsertLeave", {
  callback = function()
    vim.opt.relativenumber = true
  end,
})

-- Telescope
local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help tags" })


