local setup, comment = pcall(require, 'Comment')
if not setup then
  return
end

-- set commenting
comment.setup()
