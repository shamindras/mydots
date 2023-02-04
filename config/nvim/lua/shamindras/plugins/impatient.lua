-- import impatient plugin safely
local setup, impatient = pcall(require, 'impatient')
if not setup then
  return
end

-- Setup impatient with profiling
impatient.enable_profile()
