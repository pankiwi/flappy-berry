local l, t, w, h = Cam:getWindow()
local wl, wt, ww, wh = Cam:getWorld()

local Ground = require("src/Scene/Ground")

SceneManager = {}
SceneManager.__index = SceneManager

function SceneManager:load()
  self.grounds = {
    Ground(CAM_MIN_X + 180, CAM_MIN_Y + 50,0,-100, Atlas:get("base")),
    Ground(CAM_MAX_X + 180, CAM_MAX_X - 50,0,-100, Atlas:get("base"))
  }
  
end

function SceneManager:drawGround()
  for index, ground in ipairs(self.grounds) do
    ground:draw()
  end
end

function SceneManager:updateGround(dt)
  for index, ground in ipairs(self.grounds) do
    ground:update(dt)
  end
end
