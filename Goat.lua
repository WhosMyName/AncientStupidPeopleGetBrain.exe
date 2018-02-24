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
function Goat:move()
end

function Goat:draw(x,y )
	r, g, b, a = love.graphics.getColor( )
	love.graphics.setColor(128,128,128)
	love.graphics.circle("fill", x, y, Goat.r)
	love.graphics.setColor(r, g, b, a)
end

return Goat
