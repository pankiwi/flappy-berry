local state = require("src/states/state")
local W, H = love.graphics.getDimensions()
local l, t, w, h = Cam:getWindow()
local wl, wt, ww, wh = Cam:getWorld()
menu = state()

function menu:init()
end

function menu:drawCam()
  SceneManager:drawGround()
  drawTxt("0,0",0,0,0,0)
  drawTxt("width: " .. Cam.w,Cam.w,0,0,0)
  
  love.graphics.circle('fill', Cam.x, Cam.y, 10)
  local x1, y1 = Cam:toWorld(300,300)
  love.graphics.draw(Atlas:get("berry"), x1, y1)
  local x2, y2 = Cam:toScreen(300,300)
    love.graphics.draw(Atlas:get("berry"), x2, y2)
  
  
  drawCameraBounds(Cam, "line")
end

function menu:drawPosCam()
  love.graphics.rectangle("line", 32, 0, 1, H)
  love.graphics.rectangle("line", W - 32, 0, 1, H)
  
  love.graphics.rectangle("line", 0, 32, W, 1)
  love.graphics.rectangle("line", 0, H - 32, W, 1)
  
  
  drawTxt("cam x: " .. Cam.x .. " y: " .. Cam.y,W/2,H/2)
  drawTxt("mobile screen W: " .. W .. " H: " .. H,W/2,H/2 - 10)
  drawTxt(" Camera width W: " .. Cam.w .. " H: " .. Cam.h,W/2,H/2 - 20)
  drawTxt(" scale: " .. Cam.scale,W/2,H/2 - 30)
  drawTxt("l: " .. l .. " t: " .. t .. " w: " .. w .. " h: " .. h, W/2, H/2 - 40)
  drawTxt("l: " .. wl .. " t: " .. wt .. " w: " .. ww .. " h: " .. wh, W/2, H/2 - 60)
end

function menu:update(dt)
end

function menu:touchreleased(id, x, y, dx, dy, pressure)
  local xc, yc = Cam.x, Cam.y
  local scale= Cam:getScale()
  if(x < 32)then
    xc = xc + 1
  end
  if(x > W - 32)then
      xc = xc - 1
  end
  
  if(y < 32)then
     scale = scale + .1
    end
    if(y > H - 32)then
     scale = scale - .1
    end
  Cam:setScale(scale)
  Cam:setPosition(xc, yc)
end
function menu:keypressed(key, scancode, isrepeat)
  logger:info(key)
end
function drawTxt(txt, x, y)
  love.graphics.print(txt,(x) - love.graphics.getFont():getWidth(txt) / 2,(y) - love.graphics.getFont():getHeight(txt) / 2)
end
