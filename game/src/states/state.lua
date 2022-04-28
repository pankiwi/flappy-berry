local Object = require("libs/classic")

local state = Object:extend()
state:implement(GameState.new())

function state:new()
  --ui
  self.uiAnimation = {}
  --event
  self.events = {}
end

function state:draw()
  self:drawPreCam()
  --Cam:push()
  Cam:draw(function(l,t,w,h)
    self:drawCam()
  end)
  
 -- Cam:pop()
  self:drawPosCam()
end

function state:update(dt)
  
end

function state:drawPreCam()
end

function state:drawCam()
end

function state:drawPosCam()
end

function state:remove()
  self.removeObject = true
end

function state:getPosition()
  return self.x, self.y
end

return state
