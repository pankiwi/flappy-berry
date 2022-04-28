function initGame()
  --globals
  debug = false
  widthScreen, heightScreen = love.graphics.getDimensions()
  --filters
  
  
  
  love.graphics.setBackgroundColor(105/255, 208/255, 238/255)
  love.graphics.setDefaultFilter("nearest", "nearest")
  
  require("src/util/logger")
  
  logger:clear()
  
  --lib
  AtlasLoader = require("libs/atlas")
  GameState = require("libs/hump.gamestate")
  
  local infoGame = require("/src/infoGame")
  
  logger:info(infoGame.name)
  logger:info(infoGame.name .. " version: " .. infoGame.version)
  
  local SourceAtlas = require("src/util/SourceAtlas")
  Atlas = SourceAtlas:new(love.graphics.newImage("assets/error.png"))
  Atlas:load("assets/load")
  
  local windfield = require("libs/windfield")
  World = windfield.newWorld(0, 300, false)
  
  createClassHitBox()
  
  require("src/requireScripts")
  requireScripts()
  
  SceneManager:load()
end

function createClassHitBox()
  World:addCollisionClass('Ignore', {ignores = {'Ignore'}})
  World:addCollisionClass('Player', {ignores = {'Ignore'}})
  World:addCollisionClass('Wall', {ignores = {'Ignore'}})
end
