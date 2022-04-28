--module
local SourceAtlas = {}

function SourceAtlas:new(spriteError)
  local new = {}
  new.atlas = {}
  new.default = spriteError
  
  setmetatable(new, self)
  self.__index = self
  return new
end

function SourceAtlas:getDefault()
  return self.default
end

function SourceAtlas:add(name, data)
  self.atlas[name] = data
end

function SourceAtlas:get(name)
  return self.atlas[name] or self.default
end


function SourceAtlas:load(fileAtlas)
  local data = require(fileAtlas)
  
  for index, dataSprite in pairs(data) do
  if(not dataSprite.isAtlas)then
  self:add(dataSprite.name, love.graphics.newImage(dataSprite.path))
  elseif(dataSprite.isAtlas)then
  self:add(dataSprite.name, AtlasLoader.load(dataSprite.path))
  end
  end
end

return SourceAtlas
