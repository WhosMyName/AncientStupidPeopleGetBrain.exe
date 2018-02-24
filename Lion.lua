local Bear = {}

local mt = {__index = Bear}

function Bear:new()
  local new = {}
  setmetatable(new, mt)
  return new
end

function Bear:move()
end

function Bear:eat()
end

function Bear:draw()
end

return Bear