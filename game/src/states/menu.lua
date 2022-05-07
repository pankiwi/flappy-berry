local state = require("src/states/state")
local SceneManager = require("src/Scene/SceneManager")
menu = state()

function menu:init()
end

function menu:drawCam()
end

function menu:drawPosCam()
end

function menu:update(dt)
end

function menu:touchreleased(id, x, y, dx, dy, pressure)
end
function menu:keypressed(key, scancode, isrepeat)
  if(key "space")then
    menu:quit()
  end
end
