local Goat = {}
Goat.r = 5

local mt = {__index = Goat}

function Goat.new(x, y)
	local new = {}
	self.food = 30
	self.life = 5
	self.x = x
	self.y = y 
	setmetatable(new, mt)
	return new
end
function Goat:eat()
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
function Goat:reciveDmg(dmg)
	self.life = self.life - dmg 
end
function Goat:move(dx, dy)
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

function Goat:draw()
	r, g, b, a = love.graphics.getColor( )
	love.graphics.setColor(128,128,128)
	love.graphics.circle("fill", self.x, self.y, Goat.r)
	love.graphics.setColor(r, g, b, a)
end

return Goat
