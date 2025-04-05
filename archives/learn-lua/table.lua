local level = 4

local choice_tbl =
  {
    [1] = 'chapter',
    [2] = 'section',
  }

print(choice_tbl[3])

if not choice_tbl[level] then
  print('do not support level: ' .. level)
  return
end