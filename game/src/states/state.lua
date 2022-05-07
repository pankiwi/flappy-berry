local Object = require("libs/classic")

local state = Object:extend()
state:implement(GameState.new())

function state:new()
end

function state:draw()
  love.graphics.scale(SCALE)
  love.graphics.translate(0, SHIFTDOWN)
  love.graphics.setColor(1, 1, 1)
  self:drawState()
end

function state:update(dt)
  
end

function state:drawState()
end

return state
