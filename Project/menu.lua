-----------------------------------------------------------------------------------------
--
-- menu.lua
--
-----------------------------------------------------------------------------------------

local composer = require("composer")
local scene = composer.newScene()

--------------------------------------------
local function instructionsBtnPress(event)
	-- button listener for overlayHelpBtn
	event.target.xScale = 0.95
	event.target.yScale = 0.95
	composer.showOverlay("instructionsOverlay", {effect = "fade", isModal = true})
end

-- 'onRelease' event listener for playBtn
local function playBtnPress()	
	-- go to question1.lua scene
	composer.gotoScene( "question1", "crossFade", 500)
	
	return true	-- indicates successful touch
end

function scene:create(event)
	local sceneGroup = self.view

	-- display a background image
	local background = display.newImageRect("background.jpg", display.actualContentWidth, display.actualContentHeight)
	background.anchorX = 0;background.anchorY = 0
	background.x = 0 + display.screenOriginX;background.y = 0 + display.screenOriginY
	
	-- create/position logo/title image on upper-half of the screen
	local titleLogo = display.newImageRect("logo.png", 226, 22)
	titleLogo.x = display.contentCenterX;titleLogo.y = 100
	
	-- create/position logo/title image on upper-half of the screen
	local shuLogo = display.newImageRect("shulogo.PNG", 245, 133)
	shuLogo.x = display.contentCenterX;shuLogo.y = 290
	
	-- create/position logo/title image on upper-half of the screen
	local titleCreator = display.newImageRect("creator.png", 83, 39)
	titleCreator.x = display.contentCenterX;titleCreator.y = 180
	
	local playBtn = display.newImageRect ("play.png", 85, 19)
	playBtn.destination = "playBtn"
	playBtn.x = display.contentCenterX;playBtn.y = 440
	playBtn:addEventListener ("tap", playBtnPress)
	
	local instructionsBtn = display.newImageRect ("instructions.png", 113, 16)
	instructionsBtn.destination = "instructionsBtn"
	instructionsBtn.x = display.contentCenterX;instructionsBtn.y = 400
	instructionsBtn:addEventListener ("tap", instructionsBtnPress)
	
	-- all display objects must be inserted into group
	sceneGroup:insert(background)
	sceneGroup:insert(shuLogo)
	sceneGroup:insert(titleLogo)
	sceneGroup:insert(titleCreator)
	sceneGroup:insert(playBtn)
	sceneGroup:insert(instructionsBtn)
end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener("create", scene)

-----------------------------------------------------------------------------------------

return scene