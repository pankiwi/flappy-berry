love.window.setMode(1, 2)

function love.load()
  require("src/initGame")
  initGame()
  
  GameState.registerEvents{"draw", "update", "touchreleased", "keypressed"}
  GameState.switch(menu)
end
