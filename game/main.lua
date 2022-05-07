function love.load(arg)
  require("src/initGame")
  initGame()
  GameState.registerEvents{"draw", "update", "touchreleased", "touchpressed", "keypressed"}
  GameState.switch(game)
end
