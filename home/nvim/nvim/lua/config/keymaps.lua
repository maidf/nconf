vim.g.mapleader = " "

vim.g.maplocalleader = " "



local keymap = vim.keymap



---------- 插入模式 -----------
---
---
---
---
---
------------- 视觉模式 -----------
---
---
---
----- 块移动
---
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")
---
---
---
----- 剪切板
---
keymap.set("v", "<leader><space>y", '"+y')
keymap.set("v", "<leader><space>p", '"+p')
---
---
---
------------- 正常模式 -----------
---
---
---
----- 窗口创建
---
----- 水平窗口
---
keymap.set("n", "<leader>sv", "<C-w>v")
---
----- 垂直窗口
---
keymap.set("n", "<leader>sh", "<C-w>s")
---
----- 取消高亮
---
keymap.set("n", "<leader>nh", ":nohl<CR>")
---
----- 切换窗口
---
keymap.set("n", "<leader>h", "<C-w>h")
---
keymap.set("n", "<leader>j", "<C-w>j")
---
keymap.set("n", "<leader>k", "<C-w>k")
---
keymap.set("n", "<leader>l", "<C-w>l")
---
keymap.set("n", "<leader>c", "<C-w>c")
---
---
---
----- 打开目录树
---
keymap.set("n", "<leader>e", ":Ex<cr>")
---
---
---
----- 剪切板
---
keymap.set("n", "<leader><space>y", '"+y')
---
keymap.set("n", "<leader><space>p", '"+p')

-- 搜索
keymap.set("n", "<C-f", "/")
keymap.set("n", "<C-h", ":%s/")
