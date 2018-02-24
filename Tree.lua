local Tree = {}

local mt = {__index = Tree}

function Tree:new()
  local new = {}
  setmetatable(new, mt)
  return new
end

function Tree:draw()
end

return Tree