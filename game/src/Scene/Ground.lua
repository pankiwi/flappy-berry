local Object = require("libs/classic")

local Ground = Object:extend()

function Ground:new(x, y, rotation, speed, sprite, widthScroll)
  self.x = x
  self.y = y 
  self.sprite = sprite or Atlas:getDefault()
  self.rotation = rotation or 0
  self.speed = speed
  self.scroll = 0
  self.widthScroll = widthScroll or self.sprite:getWidth()
  self.tiles = (CAM_MAX_X/self.widthScroll) + 1
end

function Ground:draw()
  for i = 0, self.tiles do
  love.graphics.draw(self.sprite, self.x + (i * self.widthScroll) + self.scroll, self.y, self.rotation, nil, nil, self.sprite:getWidth()/2, self.sprite:getHeight()/2)
  end
end

function Ground:update(dt)
  self.scroll = self.scroll + self.speed * dt
  
  if math.abs(self.scroll) > self.widthScroll then
    self.scroll = 0
  end
  
end

function Ground:getPosition()
  return self.x, self.y
end

return Ground
