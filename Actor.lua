local Actor = {}


local mt = { __index = Actor }

function Actor.new(x,y)
  local new = {x=x,y=y}
  new.Brain = require 'deepqlearn'
  new.Brain.init(1, 3)   
  setmetatable(new,mt)
  return new
end

function Actor:draw(x,y,scale)
  love.graphics.setColor(0,200,200)
  love.graphics.circle("fill",x,y,scale)
end

function Actor:move(dx,dy)
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

function Actor:noexplore()
  self.Brain.epsilon_test_time = 0.0; -- don't make any more random choices
  self.Brain.learning = false;
end

function Actor:step(sensations,reward)
  local state = table.copy(sensations) -- make a deep copy
  local action = self.Brain.forward(state) -- returns index of chosen action
   
  self.Brain.backward(reward) -- learning magic happens 

  return action
end

return Actor
