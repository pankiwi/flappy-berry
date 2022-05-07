function love.conf(t)
  t.title = "test Game"
  t.version = 11.1
  t.window.width = 1080
  t.window.height = 1920
  t.window.resizable = false
  t.identity = "com.pankiwi.test"
  t.externalstorage = true
  if love._os == "iOS" then
  		t.window.borderless = true
  elseif love._os == "Android" then
  		t.window.fullscreen = true
  end
end
