local pi, sin, cos = math.pi, math.sin, math.cos

Mathf = {}

Mathf.angleToRadians = pi/180
Mathf.radiansToAngle = 180/pi

--distance of positions
function Mathf.dist(x1,y1, x2,y2)
  return ((x2-x1)^2+(y2-y1)^2)^0.5
end

--get calulated angle of position
function Mathf.angle(x1,y1, x2,y2)
  return math.atan2(y2-y1, x2-x1)
end

--restrict a number
function Mathf.clamp(value, minValue, maxValue) 
  return math.min(math.max(minValue, value), maxValue) 
end

--rotate position
function Mathf.rotate(x, y, angle)
 local radians = angle * Mathf.angleToRadians
 local asin, acos = sin(radians), cos(radians)
 return x * acos - y * asin, x * asin + y * acos
end
--move position of angle
function Mathf.trns(x, y, length, angle)
  return x + cos(pi * angle / 180) * length, y + sin(pi * angle / 180) * length;
end
