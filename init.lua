require("plugins")

-- START config nvim
-- show line number
vim.opt.number = true
-- show verticle line "80, 120"
vim.opt.colorcolumn = "120"
-- END config nvim

-- START config refer to function
-- local opts = { noremap=true, silent=true }
-- vim.api.nvim_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)  -- Nhảy đến định nghĩa
-- vim.api.nvim_set_keymap('n', 'g<Space>', '<C-o>', opts)  -- Quay lại vị trí trước
-- END config refer to function

-- START config treeview + icons 
-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true
-- empty setup using defaults
require("nvim-tree").setup({
  update_focused_file = {
    enable = true,        -- Auto focus on file opening
    update_cwd = true,    -- update files opening
  },
  view = {
    side = 'left',
    width = 30,
  },
  renderer = {
    icons = {
      webdev_colors = true,
    },
  },
})
-- require('nvim-web-devicons').setup()
-- END config treeview + icons 

-- START config telescope
-- Ctrl+P search file
vim.api.nvim_set_keymap('n', '<C-p>', ':Telescope find_files<CR>', { noremap = true, silent = true })
-- END config teleascope

-- START config multiple tabs
vim.opt.termguicolors = true
require("bufferline").setup({})
-- END config multiple tabs

-- START config PHP config
require("lspconfig").intelephense.setup({
  on_attach = function(client, bufnr)
    local opts = { noremap=true, silent=true }
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)  -- Nhảy đến định nghĩa
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'g<Space>', '<C-o>', opts)  -- Quay lại vị trí trước
  end
})
-- cmp
local cmp = require("cmp")
cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)  -- Mở rộng snippet
    end,
  },
  mapping = {
    ['<C-n>'] = cmp.mapping.select_next_item(),  -- Chọn item tiếp theo
    ['<C-p>'] = cmp.mapping.select_prev_item(),  -- Chọn item trước
    ['<C-Space>'] = cmp.mapping.complete(),  -- Hoàn thành
    ['<C-e>'] = cmp.mapping.close(),  -- Đóng menu
  },
  sources = {
    { name = 'nvim_lsp' },  -- LSP
    { name = 'buffer' },     -- Buffer
    { name = 'path' },       -- Đường dẫn
  }
})
-- END config PHP config

