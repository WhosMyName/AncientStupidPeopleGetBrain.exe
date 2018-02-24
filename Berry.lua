local Berry = {}

local mt = {__index = Berry}

function Berry.new(x, y)
    local new = {}
    setmetatable(new, mt)
    self.food = 10
    self.x = x
    self.y = y
    return new
end

function Berry:draw(x, y, scale)
    love.graphics.setColor(255,0,0)
    love.graphics.circle("line",x,y,scale)
end

function Berry:harvest()
    return self.food
end

return Berry