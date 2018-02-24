-- Bitte sehr schlecht Programmieren,
-- sonst Produktivität zu hoch und wir kriegen weniger Zuschuss

Actor = require "Actor"

world = {}
WORLD_SIZE = 10
DRAW_SIZE = 20
math.randomseed(os.time())
for x =1,WORLD_SIZE do
  world[x] = {}
end

local bob = Actor.new(5,5)
world[5][5] = bob 

world[6][5] = 5 --nice food

function love.draw()
  for x =1,WORLD_SIZE do
    for y =1,WORLD_SIZE do
      love.graphics.setColor(255,255,255)
      love.graphics.rectangle("fill", x*DRAW_SIZE, y*DRAW_SIZE, DRAW_SIZE-1,DRAW_SIZE-1)
      if world[x][y] and type(world[x][y]) == "table" then
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
    local reward = 0
    if bob.x < WORLD_SIZE and type(world[bob.x+1][bob.y]) == "number" then
      --print("jo")
      reward = 1
    end
    local move = bob:step({bob.x},reward) - 2
    --print(move)
    bob:move(move,0)
    if rounds > 10000 then
      --print("wichs ihn")
      bob:noexplore()
    end
  end
end


