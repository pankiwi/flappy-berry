Player = World:newBSGRectangleCollider(WIDTH/2 - PLAYER_HITBOX_WIDTH/2, HEIGHT/2 - PLAYER_HITBOX_HEIGHT/2, PLAYER_HITBOX_WIDTH, PLAYER_HITBOX_HEIGHT, 10)
Player:setCollisionClass("Player")
Player:setMass(10)
Player:getLinearDamping(10)
Player.spriteBody = Atlas:get("berry")

function Player:draw()
  local x, y = Player:getPosition()
  local rotation = Player:getAngle()
  
  love.graphics.draw(Player.spriteBody, x, y, rotation, nil, nil, Player.spriteBody:getWidth()/2, Player.spriteBody:getHeight()/2)
end

function Player:hit(owner)
  --logger:info("hit Orbdkbsjzownz x")
end

function Player:jump(forze)
  self:setLinearVelocity(0,0)
  self:applyLinearImpulse(0, forze or JUMP_PLAYER_FORZE)
end
