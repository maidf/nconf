local opt = vim.opt



-- 行号
--
opt.relativenumber = true
--
opt.number = true
--
--
--
-- -- 缩进
--
opt.tabstop = 4
--
opt.shiftwidth = 4
--
opt.expandtab = true
--
opt.autoindent = true
--
--
--
-- -- 光标
--
opt.cursorline = true
--
--
--
-- -- 自动换行
--
-- -- opt.wrap = false
--
--
--
-- -- 启用鼠标
--
opt.mouse:append("a")
opt.mousemoveevent = true
--
--
--
-- -- 系统剪切板
--
-- -- opt.clipboard:append("unnamed")
--
--
--
-- -- 新建窗口位置
--
opt.splitright = true
--
opt.splitbelow = true
--
--
--
-- -- 搜索
--
opt.smartcase = true
--
--
--
-- -- 外观
--
opt.termguicolors = true
--
opt.signcolumn = "yes"
--
-- -- vim.cmd[[colorscheme tokyonight]]
