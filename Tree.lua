local Tree = {}

local mt = {__index = Tree}

function Tree.new(x, y)
    local new = {}
    setmetatable(new, mt)
    self.x = x
    self.y = y
    return new
end

function Tree:draw()
    love.graphics.setColor(0,255,0)
    love.graphics.circle("fill",x,y,scale)
end

return Tree