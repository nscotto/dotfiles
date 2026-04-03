-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local opt = vim.opt

opt.colorcolumn = "80"
opt.swapfile = false

vim.g.clipboard = {
	name = "win32yank-wsl",
	copy = {
		["+"] = "win32yank.exe -i --crlf",
		["*"] = "win32yank.exe -i --crlf",
	},
	paste = {
		["+"] = "win32yank.exe -o --lf",
		["*"] = "win32yank.exe -o --lf",
	},
	cache_enabled = 0,
}

-- local function paste()
-- 	local content = vim.fn.system("win32yank.exe -o --lf")
-- 	return { vim.split(content, "\n"), "v" }
-- end
--
-- local function copy(lines, _)
-- 	local content = table.concat(lines, "\n")
-- 	vim.fn.system("win32yank.exe -i --crlf", content)
-- 	-- Also use OSC 52 as backup
-- 	require("vim.ui.clipboard.osc52").copy("+")(lines)
-- end
--
-- vim.g.clipboard = {
-- 	name = "win32yank-wsl",
-- 	copy = {
-- 		["+"] = copy,
-- 		["*"] = copy,
-- 	},
-- 	paste = {
-- 		["+"] = paste,
-- 		["*"] = paste,
-- 	},
-- }
