-- import nvim-colorizer plugin safely
local status_ok, colorizer = pcall(require, 'colorizer')
if not status_ok then
  return
end

-- setup colorizer
colorizer.setup()
