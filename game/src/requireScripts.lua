function requireScripts()
  --const
  require("src/const")
  --util
  require("src/util/Mathf")
  require("src/util/util")
  --table
  require("src/tables")
  --util
  require("src/player/player")
  require("src/player/playerControllerJump")
  --scene
  require("src/Scene/SceneManager")
  --state
  require("src/states/menu")
  require("src/states/game")
end
