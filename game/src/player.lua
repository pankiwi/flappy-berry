Player = World:newBSGRectangleCollider(0, 400, 20, 20, 10)
Player.spriteBody = Atlas:get("berry")

function Player:draw()
  local x, y = Player:getPosition()
  local rotation = Player:getAngle()
  
  love.graphics.draw(self.spriteBody, x, y, rotation, nil, nil, self.spriteBody:getWidth()/2, self.spriteBody:getHeight()/2)
end
 
