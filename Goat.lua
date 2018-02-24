local Goat = {}

local mt = {__index = Goat}

function Goat:new()
  local new = {}
  setmetatable(new, mt)
  return new
end

function Goat:move()
end

function Goat:poposex()
end

function Goat:draw()
end

return Goat