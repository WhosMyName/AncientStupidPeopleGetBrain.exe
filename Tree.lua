local Tree = {}
Tree.r = 5

local mt = {__index = Tree}

function Tree.new(x, y)
    local new = {}
    setmetatable(new, mt)
    self.x = x
    self.y = y
    return new
end

function Tree:draw()
    r, g, b, a = love.graphics.getColor( )
	love.graphics.setColor(0,255,0)
	love.graphics.circle("fill", self.x, self.y, Tree.r)
	love.graphics.setColor(r, g, b, a)
end

return Tree