local Bar = require("src/graphics/bar")
local PlayerControllerJump = {}
PlayerControllerJump.__index = PlayerControllerJump

function PlayerControllerJump:load()
  local fires = Atlas:get("fires")
  self.animationFire = {
    fires:newAnimation("fires_1", 4, 0.1),
    fires:newAnimation("fires_2", 3, 0.1),
    fires:newAnimation("fires_3", 4, 0.1)
  }
  self.indexAnimationFire = 0
  self.isPressure = nil
  self.charginTime = 0
  self.playerBar = Bar(Player:getX() - 40/2, Player:getY() + PLAYER_HITBOX_HEIGHT + 10/2, 40, 10, {
    lineWidth  = 3,
    cornerRadius = 2,
    outLineColor = {90/255, 105/255, 136/255},
    backGroundColor = {58/255, 68/255, 102/255}
  })
  function self.playerBar:colorBar(prg)
    return HSL((125 - prg * 120)/360,0.85,0.52)
  end
  
  self.disableBar = false
  self.disableFire = false
  self.disableChargin = false
  self.gravityDirection = -1
  self.speedChargin = 2
  self.progressBar = 0
end

function PlayerControllerJump:draw()
  self:drawAnimationFire()
  self:drawBar()
end

function PlayerControllerJump:drawBar()
  if(not self.disableBar)then
    self.playerBar:draw()
  end
end

function PlayerControllerJump:drawAnimationFire()
  if(self.indexAnimationFire > 0 and not self.disableFire)then
    local scale = 1.6
    local x, y = Player:getX() - 32/2 * scale, Player:getY() - (32/2 + 4) * scale
    
    self.animationFire[self.indexAnimationFire]:draw(x,y, 0, scale, scale)
  end
end

function PlayerControllerJump:update(dt)
  self:updateChargin(dt)
  self:updateBar(dt)
  self:updateAnimationFire(dt)
end

function PlayerControllerJump:updateChargin(dt)
  if(self.isPressure ~= nil and not self.disableChargin)then
    self.charginTime = (self.charginTime + self.speedChargin * dt)%1.5
  end
end

function PlayerControllerJump:updateBar(dt)
  if(not self.disableChargin and not self.disableBar)then
  self.playerBar:setPosition(Player:getX() - 40/2, Player:getY() + PLAYER_HITBOX_HEIGHT + 10/2)
  self.playerBar:setProgress(self.charginTime)
  
  elseif(self.disableChargin and not self.disableBar)then
  self.playerBar:setPosition(Player:getX() - 40/2, Player:getY() + PLAYER_HITBOX_HEIGHT + 10/2)
  self.playerBar:setProgress(self.progressBar)
   end
end

function PlayerControllerJump:updateAnimationFire(dt)
  if(not self.disableFire)then
    if(self.indexAnimationFire > 0)then
      self.animationFire[self.indexAnimationFire]:update(dt)
    end
   
   if(not self.disableChargin)then
     local index = 0
     
     if(self.charginTime > 0 and self.charginTime < 0.5)then
       index = 1
     end
     if(self.charginTime > 0.5 and self.charginTime < 0.8)then
       index = 2
     end
     if(self.charginTime > 0.8)then
       index = 3
     end
     
     self:setIndexAnimationFire(index)
   end
  end
end

function PlayerControllerJump:setIndexAnimationFire(index)
  self.indexAnimationFire = index
end

function PlayerControllerJump:setProgressBar(prog)
  self.progressBar = prog
end

function PlayerControllerJump:touchreleased(id, x, y, dx, dy, pressure)
  if(self.isPressure ~= nil and id == self.isPressure and not self.disableChargin)then
    Player:jump((JUMP_PLAYER_FORZE * Mathf.clamp(self.charginTime, 0, 1)) * self.gravityDirection)
    self.isPressure = nil
    self.charginTime = 0
  end
end

function PlayerControllerJump:touchpressed(id, x, y, dx, dy, pressure)
  if(self.isPressure == nil and not self.disableChargin)then
    self.isPressure = id
  end
  
  if(self.disableChargin)then
    Player:jump(JUMP_PLAYER_FORZE * self.gravityDirection)
  end
end

return PlayerControllerJump
