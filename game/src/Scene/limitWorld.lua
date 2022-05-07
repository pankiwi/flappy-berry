local LimitWorld = {}
LimitWorld.__index = LimitWorld

function LimitWorld:load()
  self.colliders = {}
end

function LimitWorld:create()
  table.insert(self.colliders, LimitWorld.createLine(0, (GROUND_PADDING_POSITION * 2) + SHIFTDOWN, 0, WIDTH))
  
  table.insert(self.colliders, LimitWorld.createLine(0, (HEIGHT - GROUND_PADDING_POSITION * 2) + SHIFTDOWN, 0, WIDTH))
end

function LimitWorld:remove()
  for _, line in ipairs(self.colliders) do
    line:destroy()
  end
  self.colliders = {}
end

function LimitWorld.createLine(x, y, rotation, lenght)
  local x1, y1 = x, y
  local x2, y2 = Mathf.trns(x1, y1, lenght, rotation)
  local line =  World:newLineCollider(x1, y1, x2, y2)
  line:setType("static")
  return line
end

return LimitWorld
