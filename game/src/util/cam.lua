--[[
local Camera = require 'libs/Camera'
local W, H = love.graphics.getDimensions()
local offset = 0

function drawCameraBounds( cam, mode )
	love.graphics.rectangle( mode, cam.x, cam.y, cam.w, cam.h )
end

local function resizeCamera( self, w, h )
	local scaleW, scaleH = w / self.w, h / self.h
	local scale = math.min( scaleW, scaleH )
	self.w, self.h = scale * self.w, scale * self.h
	self.aspectRatio = self.w / w
	self.offsetX, self.offsetY = self.w / 2, self.h / 2
	offset = offset * scale
end

local function centerCam(w, h)
  
end

Cam = Camera( 600, 800, { x = -600/5, y = -800/5, resizable = false, maintainAspectRatio = false,
	resizingFunction = function( self, w, h )
		resizeCamera( self, w, h )
		local W, H = love.graphics.getDimensions()
		self.x = offset
		self.y = offset
	end
} )

]]--

local Camera = require 'libs/gamera'

 Cam = Camera.new(0,0,500,800)

local function cornerTransform(self, x,y)
  local scale, sin, cos = self.scale, self.sin, self.cos
  x,y = x - self.x, y - self.y
  x,y = -cos*x + sin*y, -sin*x - cos*y
  return self.x - (x/scale + self.l), self.y - (y/scale + self.t)
end

local function dimensionBoxPosition(self)
  local x,y,w2,h2 = self.x, self.y, self.w2, self.h2

  local minX,minY = cornerTransform(self, x-w2,y-h2)
  local maxX,maxY = cornerTransform(self, x+w2,y+h2)

  return minX, minY, maxX, maxY
end
 
function drawCameraBounds( cam, mode )
 	love.graphics.polygon( mode, cam:getVisibleCorners())
 end



CAM_MIN_X, CAM_MIN_Y, CAM_MAX_X, CAM_MAX_Y = dimensionBoxPosition(Cam)