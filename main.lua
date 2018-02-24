-- Bitte sehr schlecht Programmieren,
-- sonst Produktivität zu hoch und wir kriegen weniger Zuschuss

Actor = require "Actor"

world = {}
WORLD_SIZE = 10
DRAW_SIZE = 20

for x =1,WORLD_SIZE do
  world[x] = {}
  for y =1,WORLD_SIZE do
    world[x][y] = {}
  end
end

local bob = Actor.new()

function love.draw()
  for x =1,WORLD_SIZE do
    for y =1,WORLD_SIZE do
      love.graphics.rectangle("fill", x*DRAW_SIZE, y*DRAW_SIZE, DRAW_SIZE-1,DRAW_SIZE-1)
    end
  end
end


