local state = require("src/states/state")
local SceneManager = require("src/Scene/SceneManager")
local playerControllerJump = require("src/player/playerControllerJump")
local limitWorld = require("src/Scene/limitWorld")
game = state()

function game:init()
  limitWorld:create()
end

function game:drawState()
  Obstacles:draw()
  SceneManager:drawGround()
  playerControllerJump:draw()
  Player:draw()
end

function game:update(dt)
  World:update(dt)
  Obstacles:update(dt)
  SceneManager:updateGround(dt)
  playerControllerJump:update(dt)
end

function game:touchreleased(id, x, y, dx, dy, pressure)
  playerControllerJump:touchreleased(id)
end

function game:touchpressed(id, x, y, dx, dy, pressure)
  playerControllerJump:touchpressed(id)
end
