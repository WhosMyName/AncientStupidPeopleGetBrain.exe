-- Bitte sehr schlecht Programmieren,
-- sonst Produktivität zu hoch und wir kriegen weniger Zuschuss

Actor = require "Actor"

world = {}
WORLD_SIZE = 10
DRAW_SIZE = 20
math.randomseed(os.time)
for x =1,WORLD_SIZE do
  world[x] = {}
end

local bob = Actor.new()
world[5][5] = bob 

function love.draw()
  for x =1,WORLD_SIZE do
    for y =1,WORLD_SIZE do
      love.graphics.setColor(255,255,255)
      love.graphics.rectangle("fill", x*DRAW_SIZE, y*DRAW_SIZE, DRAW_SIZE-1,DRAW_SIZE-1)
      if world[x][y]then
        world[x][y]:draw(x*DRAW_SIZE,y*DRAW_SIZE,DRAW_SIZE)
      end
    end
  end
end

local timer = 0
local ROUND_LENGTH = 0.5
local rounds = 0
function love.update(dt)
  timer = timer + dt
  if timer > ROUND_LENGTH then
    rounds = rounds +1
    bob:step({1.0})
    if rounds > 1000 then
      bob:noexplore()
    end
  end
end


