local colorscheme = "catppuccin"
local status, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status then
	vim.notify("Colorscheme " .. colorscheme .. " not found!")
	return
end
