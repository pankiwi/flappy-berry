
--https://gist.github.com/FGRibreau/3790217
local function filter(t, filterIter)
  local out = {}

  for k, v in pairs(t) do
    if filterIter(v, k, t) then out[k] = v end
  end

  return out
end

--[[
  Copyright (c) 2022 Pankiwi
  
  Permission is hereby granted, free of charge, to any person obtaining
  a copy of this software and associated documentation files (the
  "Software"), to deal in the Software without restriction, including
  without limitation the rights to use, copy, modify, merge, publish,
  distribute, sublicense, and/or sell copies of the Software, and to
  permit persons to whom the Software is furnished to do so, subject to
  the following conditions:
  
  The above copyright notice and this permission notice shall be
  included in all copies or substantial portions of the Software.
  
  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
  EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
  MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
  NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
  LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
  OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
  WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
]]--

--is a simple list object
local insert, remove = table.insert, table.remove

local ObjectTable = {}
ObjectTable.__index = ObjectTable

function ObjectTable:new()
  local new = {}
  setmetatable(new, self)
  self.__index = self
    
  new.objects = {}
  new.lastID = 0
  
  return new
end

function ObjectTable:drawDebug(x_, y_)
  local x, y = x_ or 0, y_ or 0
  local txt = "ObjectTable objects:" .. #self.objects .. " lastId:" .. self.lastID
  
  love.graphics.print(txt,x - love.graphics.getFont():getWidth(txt) / 2,y - love.graphics.getFont():getHeight(txt) / 2)
  
end

function ObjectTable:update(...)
  for _, obj in ipairs(self.objects) do
    if obj.update then
      obj:update(...)
    end
  end
  
  local i = #self.objects
  while i > 0 do
    if self.objects[i].removeObject then
      remove(self.objects, i)
    end
    i = i - 1
  end
end

function ObjectTable:draw(...)
  for _, obj in ipairs(self.objects) do
    if obj.draw then
       obj:draw(...)
    end
  end
end

function ObjectTable:add(object)
  object:setId(self.lastID)
  insert(self.objects, object)
  self.lastID = self.lastID + 1
end

function ObjectTable:clear()
  --Clear is
  self.objects = nil
  self.objects = {}
end

function ObjectTable:getObjectById(id)
   return filter(self.objects, function(_, object)
   return object:getId() ~= -1 and object:getId() == id
   end)[1]
end

function ObjectTable:filter(filterIter)
 return filter(self.objects, filterIter)
end

function ObjectTable:getLast()
  return self.objects[#self.object]
end

function ObjectTable:getCurrent()
  return self.objects[1]
end

function ObjectTable:__tostring()
  return "listObject" .. #self.objects .. self.lastID
end


function ObjectTable:__call(...)
  return obj:new(...)
end

--[[
  Basic Object templated for this list 
  object = {}
  object.id = -1 -- null id
  object.removeObject = false --if is true, object remove
  
  function object:getId()
  return id
  end
  
  function object:setId(id)
  self.id = id
  end
  
  -- is optional
  function object:draw()
  end
  
  -- is optoonal
  function object:update()
  end
]]--
return ObjectTable
