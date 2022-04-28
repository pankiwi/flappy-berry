local Boolf = {}
Boolf.__index = Boolf

setmetatable(Boolf, {
    __call = function(cls, ...)
        return cls:new(...)
    end
})

function Boolf:new(BoolfCallBack)
  local new = {}
  new.get = BoolfCallBack
  setmetatable(new, self)
  self.__index = self
  return new
end

return Boolf
