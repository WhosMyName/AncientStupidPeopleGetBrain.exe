local Actor = {}

require 'xlua'

local mt = { __index = Actor }

function Actor:new()
  local Brain = require 'deepqlearn'
  local num_outcomes = 3
  Brain.init(num_outcomes, num_outcomes)   
  local new = {}
  setmetatable(new,mt)
  return new
end

function Actor:draw()
end

function Actor:move(field)
end

function Actor:step(sensations)
  local newstate = table.copy(sensations) -- make a deep copy
  local action = Brain.forward(state); -- returns index of chosen action

  local reward = (action == "GAY") and 1 or 0
   
  local Brain.backward(reward); -- learning magic happens 

  return action
end

return Actor