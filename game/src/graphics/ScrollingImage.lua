local Object = require("libs/classic")

local ScrollingImage = Object:extend()

function ScrollingImage:new(x, y, rotation, speed, sprite, widthScroll)
  self.x = x
  self.y = y 
  self.sprite = sprite or Atlas:getDefault()
  self.rotation = rotation * Mathf.angleToRadians or 0
  self.speed = speed
  self.scroll = 0
  self.widthScroll = widthScroll or self.sprite:getWidth()
  self.tiles = (WIDTH/self.widthScroll) + 1
end

function ScrollingImage:draw()
  for i = 0, self.tiles do
  love.graphics.draw(self.sprite, self.x + (i * self.widthScroll) + self.scroll, self.y, self.rotation, nil, nil, self.sprite:getWidth()/2, self.sprite:getHeight()/2)
  end
end

function ScrollingImage:update(dt)
  self.scroll = self.scroll + self.speed * dt
  
  if math.abs(self.scroll) > self.widthScroll then
    self.scroll = 0
  end
  
end

function ScrollingImage:getPosition()
  return self.x, self.y
end

return ScrollingImage
