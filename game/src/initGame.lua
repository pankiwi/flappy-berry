function initGame()
  WIDTHS = love.graphics.getWidth()
  HEIGHTS = love.graphics.getHeight()
  WIDTH = 420
  HEIGHT = 800
  
  SCALE = WIDTHS/WIDTH
  SHIFTDOWN = (HEIGHTS - (HEIGHT * SCALE)) / 2 / SCALE
  
  love.window.setMode(WIDTH * SCALE, HEIGHT * SCALE, {resizable = false})
  --filters
  love.graphics.setBackgroundColor(105/255, 208/255, 238/255)
  love.graphics.setDefaultFilter("nearest", "nearest")
  
  require("src/util/logger")
  
  logger:clear()
  
  --lib
  AtlasLoader = require("libs/atlas")
  GameState = require("libs/hump.gamestate")
  
  local SourceAtlas = require("src/util/SourceAtlas")
  Atlas = SourceAtlas:new(love.graphics.newImage("assets/error.png"))
  Atlas:load("assets/load")
  
  local windfield = require("libs/windfield")
  World = windfield.newWorld(0, 600, false)
  
  createClassHitBox()
  
  
  require("src/requireScripts")
  requireScripts()
  local SceneManager, PlayerControllerJump, LimitWorld = require("src/Scene/SceneManager"), require("src/player/playerControllerJump"), require("src/Scene/limitWorld")
  SceneManager:load()
  PlayerControllerJump:load()
  LimitWorld:load()
end

function createClassHitBox()
  World:addCollisionClass('Ignore', {ignores = {'Ignore'}})
  World:addCollisionClass('Limit', {ignores = {'Ignore'}})
  World:addCollisionClass('Player', {ignores = {'Ignore'}})
  World:addCollisionClass('Obstacle', {ignores = {'Ignore'}})
  World:addCollisionClass('ObstaclePhace', {ignores = {'Ignore', "Limit"}})
  
end
