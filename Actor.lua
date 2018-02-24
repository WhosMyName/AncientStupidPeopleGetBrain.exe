local Actor = {}


local mt = { __index = Actor }

function Actor.new()
  local new = {}
  new.Brain = require 'deepqlearn'
  new.Brain.init(1, 2)   
  setmetatable(new,mt)
  return new
end

function Actor:draw(x,y,scale)
  love.graphics.setColor(255,0,0)
  love.graphics.circle("fill",x,y,scale)
end

function Actor:move(field)
end

function Actor:noexplore()
  self.Brain.epsilon_test_time = 0.0; -- don't make any more random choices
  self.Brain.learning = false;
end

function Actor:step(sensations)
  local state = table.copy(sensations) -- make a deep copy
  local action = self.Brain.forward(state) -- returns index of chosen action

  print("action" .. action)
  local reward
  if action == 1 then
    reward = 1
  else
    reward = 0
  end

  print(reward)
   
  self.Brain.backward(reward) -- learning magic happens 

  return action
end

return Actor
