vim.api.nvim_create_autocmd({ "TextYankPost" }, {
	pattern = { "*" },
	callback = function()
		vim.highlight.on_yank({
			timeout = 500,
		})
	end,
})


-- lsp相关
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
      local bufnr = args.buf
      local client = vim.lsp.get_client_by_id(args.data.client_id)
      if client:supports_method("textDocument/completion") then
        vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"
      end
      if client:supports_method("textDocument/definition") then
        vim.bo[bufnr].tagfunc = "v:lua.vim.lsp.tagfunc"
      end
    end,
  })

vim.api.nvim_create_autocmd("LspDetach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    -- Do something with the client
    vim.cmd("setlocal tagfunc< omnifunc<")
  end,
})


-- term
vim.api.nvim_create_autocmd("TermOpen", {
    pattern = "term://*",
    callback = function ()
        local opts = {buffer = 0}
        vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
    end
})

-- vim.api.nvim_create_autocmd("TermEnter", {
--     pattern = "term://*toggleterm#*",
--     callback = function ()
--         local opts = { silent = true, buffer = 0}
--         vim.keymap.set('t', '<c-t>', function ()
--             vim.cmd(vim.v.count1 .. "ToggleTerm")
--         end, opts)
--     end
-- })
-- 
-- --普通模式映射
-- 
-- vim.keymap.set("n", "<C-t>", function()
--     vim.cmd(vim.v.count1 .. "ToggleTerm")
-- end, { silent = true })
-- 
-- 
-- 
-- -- 插入模式映射
-- 
-- vim.keymap.set("i", "<C-t>", function()
--     vim.cmd("stopinsert")  -- 等效于 <Esc>
--     vim.cmd(vim.v.count1 .. "ToggleTerm")
-- end, { silent = true })
