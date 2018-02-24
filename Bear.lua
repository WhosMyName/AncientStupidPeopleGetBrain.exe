local Bear = {}

local mt = {__index = Bear}

function Bear.new(x, y)
    local new = {}
    setmetatable(new, mt)
    self.life = 20
    self.food = 60
    self.x = x
    self.y = y
    return new
end

function Bear:move()
end

function Bear:attack(target)
    target.life = target.life - 5
end

function Bear:get_eaten()
    if self.life > 0 then
        self.life = self.life -1 
        return -1
    end	
    if self.food <= 5 then 
        food = self.food
        world[x][y] = nil
        return food
    end
    self.food = self.food - 5

    return 5
end

function Bear:draw(x, y, scale)
    love.graphics.setColor(255,0,0)
    love.graphics.circle("fill",x,y,scale)
end

return Bear