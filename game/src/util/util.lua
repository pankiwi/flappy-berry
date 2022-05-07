--module
function cloneObject(obj)
  local clone = {}
  setmetatable(clone, obj)
  obj.__index = obj
  return clone
end

function randomSelection(any, any2, change)
  if(math.random() < change)then
    return any
  else
    return any2
  end
 end

function calculatedScale(width, height)
  local scale_x = love.graphics.getWidth()  / width
  local scale_y = love.graphics.getHeight() / height
  return math.min(scale_x, scale_y)
end

function setColor(r, g, b, a)
    love.graphics.setColor(r/254, g/255, b/255, (a or 255)/255)
end

function HSL(h, s, l, a)
	if s<=0 then return l,l,l,a end
	h, s, l = h*6, s, l
	local c = (1-math.abs(2*l-1))*s
	local x = (1-math.abs(h%2-1))*c
	local m,r,g,b = (l-.5*c), 0,0,0
	if h < 1     then r,g,b = c,x,0
	elseif h < 2 then r,g,b = x,c,0
	elseif h < 3 then r,g,b = 0,c,x
	elseif h < 4 then r,g,b = 0,x,c
	elseif h < 5 then r,g,b = x,0,c
	else              r,g,b = c,0,x
	end return r+m, g+m, b+m, a
end