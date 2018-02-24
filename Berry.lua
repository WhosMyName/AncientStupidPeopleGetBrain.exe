local Berry = {}
Berry.r = 5

local mt = {__index = Berry}

function Berry.new(x, y)
    local new = {}
    setmetatable(new, mt)
    self.food = 10
    self.x = x
    self.y = y
    return new
end

function Berry:draw()
    r, g, b, a = love.graphics.getColor( )
	love.graphics.setColor(255,0,0)
	love.graphics.circle("line", self.x, self.y, Tree.r)
	love.graphics.setColor(r, g, b, a)
end

function Berry:harvest()
    return self.food
end

return Berry