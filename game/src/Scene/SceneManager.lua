local ScrollingImage = require("/src/graphics/ScrollingImage")
local SceneManager = {}
SceneManager.__index = SceneManager

function SceneManager:load()
  self.grounds = {
    ScrollingImage(180/2,GROUND_PADDING_POSITION + SHIFTDOWN,180,-100, Atlas:get("ground_top")),
    ScrollingImage(180/2,(HEIGHT - GROUND_PADDING_POSITION) + SHIFTDOWN,0,-100, Atlas:get("ground_top"))
  }
  self.undergrounds = {}
  for i = 0, GROUND_TILES, 1 do
    local offent = GROUND_PADDING_POSITION + (GROUND_PADDING_POSITION) * i
    
    table.insert(self.undergrounds, ScrollingImage(180/2, (-offent) + SHIFTDOWN, 180, -100, Atlas:get("ground_underground")))
    table.insert(self.undergrounds, ScrollingImage(180/2,HEIGHT + offent, 0, -100, Atlas:get("ground_underground")))
  end
end

function SceneManager:drawGround()
  for index, ground in ipairs(self.grounds) do
    ground:draw()
  end
  for index, ground in ipairs(self.undergrounds) do
    ground:draw()
  end
end

function SceneManager:updateGround(dt)
  for index, ground in ipairs(self.grounds) do
    ground:update(dt)
  end
  for index, ground in ipairs(self.undergrounds) do
    ground:update(dt)
  end
end

return SceneManager
