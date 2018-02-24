local Bear = {}
Bear.r = 5

local mt = {__index = Bear}

function Bear.new(x, y)
    local new = {}
    setmetatable(new, mt)
    self.life = 20
    self.food = 60
    self.x = x
    self.y = y
    self.dmg = 5
    return new
end

function Bear:move()
    local new_x = math.max(math.min(WORLD_SIZE,self.x+dx),1)
    local new_y = math.max(math.min(WORLD_SIZE,self.y+dy),1)
    if not world[new_x][new_y] then
        world[new_x][new_y] = self
        --print(new_x .. " " .. new_y)
        world[self.x][self.y] = nil
        self.x = new_x
        self.y = new_y
    end
end

function Bear:attack(target)
    target.life = target.life - self.dmg
end

function Bear:receiveDmg(dmg)
    self.life = self.life - dmg 
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

function Bear:draw()
    r, g, b, a = love.graphics.getColor( )
	love.graphics.setColor(255,0,0)
	love.graphics.circle("fill", self.x, self.y, Bear.r)
	love.graphics.setColor(r, g, b, a)
end

return Bear