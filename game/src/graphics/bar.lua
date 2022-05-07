local Object = require("libs/classic")

local Bar = Object:extend()

function Bar:new(x, y, width, height, style)
  self.x = x
  self.y = y 
  self.width = width
  self.height = height
  self.progress = 0 -- 1 is full
  self.style = setmetatable(style, {
    lineWidth = 3,
    cornerRadius = 10,
    outLineColor = {0,120,0},
    backGroundColor = {120, 0, 0},
    barColor = {255,255,0,255},
    customColor = false
  })
end

function Bar:draw()
  love.graphics.setColor(self.style.backGroundColor)
  love.graphics.rectangle("fill", self.x, self.y, self.width, self.height, self.style.cornerRadius, self.style.cornerRadius)
  
  if(self.progress > 0.01)then
  love.graphics.setColor(self:colorBar(self.progress))
  love.graphics.rectangle("fill", self.x, self.y, self.width* self.progress + 0.001, self.height, self.style.cornerRadius, self.style.cornerRadius)
  end
  love.graphics.setColor(self.style.outLineColor)
  love.graphics.setLineWidth(self.style.lineWidth)
  love.graphics.rectangle("line", self.x, self.y, self.width, self.height, self.style.cornerRadius, self.style.cornerRadius)
  love.graphics.setColor(1,1,1,1)
end

function Bar:colorBar(prg)
  return self.style.barColor
end

function Bar:update(dt)
  
end

function Bar:getPosition()
  return self.x, self.y
end

function Bar:setPosition(x, y)
  self.x, self.y = x, y
end

function Bar:setProgress(prg)
  self.progress = Mathf.clamp(prg,0, 1)
end

return Bar
