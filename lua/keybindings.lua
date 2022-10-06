local pluginKeys = {}

-- 设定映射函数
-- set map function
local map = vim.api.nvim_set_keymap
local opt = {noremap = true, silent = true }
local wk = require("which-key")

-- basic operation for write and quit
-- 文件写入退出基本操作
wk.register({
  ["<Leader>s"] = {":w<CR>", "Save File"},
  ["<Leader>q"] = {":qa<CR>", "Quit All"},
  ["<Leader>S"] = {":wa<CR>", "Save All"},
})

-- code related
-- 代码相关
map("n", ",", ":RunCode<CR>", opt)

-- file related
-- 文件相关操作
wk.register({
  ["<Leader><Tab>"] = {"<C-^>", "Last file"},
})

wk.register({
  ["<Leader>f"] = {
    name = "+File",
    p = {":Telescope projects<CR>", "Open project"},
    r = {":Telescope oldfiles<CR>", "Recent files"},
    n = {":enew<CR>", "New file"},
  },
})

-- jk map to esc
-- jk映射为esc键
map("i", "jk", "<Esc>", opt)

-- window operate by which-key
-- 窗口操作(使用which-key快捷键设置)
wk.register({
  ["<Leader>w"] = {
    name = "+Window",
    h = {"<C-w>h", "To left"},
    j = {"<C-w>j", "To up"},
    k = {"<C-w>k", "To down"},
    l = {"<C-w>l", "To right"},
    s = {":sp<CR>", "Split window"},
    v = {":vsplit<CR>", "Vsplit window"},
    d = {":close<CR>", "Close window"},
    o = {":only<CR>", "Close others"},
  },
})

--一般映射方式
--map("n", "<Leader>wh", "<C-w>h", opt)
--map("n", "<Leader>wj", "<C-w>j", opt)
--map("n", "<Leader>wk", "<C-w>k", opt)
--map("n", "<Leader>wl", "<C-w>l", opt)

-- base operation for visual mode
-- 可视模式下基本操作
map('v', '<', '<gv', opt)
map('v', '>', '>gv', opt)

-- nvimTree 
map("n", "n", ":NvimTreeToggle<CR>", opt)

-- Packer
wk.register({
  ["<Leader>p"] = {
    name = "+Packer",
    i = {":PackerSync<CR>", "PackerSync"},
    s = {":PackerStatus<CR>", "PackerStatus"},
    c = {":PackerClean<CR>", "PackerClean"},
  },
})

-- Bufferline and buffer related
wk.register({
  ["<Leader>b"] = {
    name = "+Buffer",
    h = {":BufferLineCyclePrev<CR>", "Left tab"},
    l = {":BufferLineCycleNext<CR>", "Right tab"},
    k = {":bd<CR>", "Kill buffer"},
    b = {":bp<CR>", "Last buffer"},
    n = {":ls<CR>", "Buffer numbers"},
    t = {":b ", "To buffer"},
  },
})

-- Mason
wk.register({
  ["<Leader>l"] = {
    name = "+Lsp",
    i = {":LspInstall<CR>", "Install lsp"},
    I = {":MasonInstall ", "Install any"},
    l = {":Mason<CR>", "Mason info"},
    u = {":MasonUninstall<CR>", "Uninstall lsp"},
    U = {":MasonUninstallAll<CR>", "Unistall all"},
  }
})


-- Telescope
map("n", "f", ":Telescope find_files<CR>", opt)


-- cmpeletion keys
-- 补全快捷键
pluginKeys.cmp = function(cmp)
  return {
    -- next option 
    -- 下一个
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<Up>'] = cmp.mapping.select_prev_item(),

    ['<CR>'] = cmp.mapping.confirm({
      select = true,
      behavior = cmp.ConfirmBehavior.Replace
    })
  }
end


return pluginKeys
