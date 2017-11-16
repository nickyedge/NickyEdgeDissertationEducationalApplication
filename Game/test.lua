-----------------------------------------------------------------------------------------
--
-- test.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

-- include Corona's "widget" library
local widget = require "widget"

--------------------------------------------

local t = display.newText( "Waiting for button event...", 0, 0, native.systemFont, 18 )
t.x, t.y = display.contentCenterX, 70

-- forward declarations and other locals
local rightAnswer

-- 'onRelease' event listener for playBtn
local function onRightAnswer()
	
	-- go to level1.lua scene
	composer.gotoScene( "level1", "fade", 500 )
	
	return true	-- indicates successful touch
end

local buttonHandler = function( event )
	t.text = "id = " .. event.target.id .. ", phase = " .. event.phase
end

function scene:create( event )
	local sceneGroup = self.view

	-- Called when the scene's view does not exist.
	-- 
	-- INSERT code here to initialize the scene
	-- e.g. add display objects to 'sceneGroup', add touch listeners, etc.

	-- display a background image
	local background = display.newImageRect( "background.jpg", display.actualContentWidth, display.actualContentHeight )
	background.anchorX = 0
	background.anchorY = 0
	background.x = 0 + display.screenOriginX 
	background.y = 0 + display.screenOriginY
	
	-- create/position logo/title image on upper-half of the screen
	local titleLogo = display.newImageRect( "logo.png", 264, 42 )
	titleLogo.x = display.contentCenterX
	titleLogo.y = 100
	
	-- create a widget button (which will loads level1.lua on release)
 rightAnswer = widget.newButton
{
	id = "rightAnswer",
	defaultFile = "buttonGray.png",
	overFile = "buttonBlue.png",
	label = "Example Answer 2",
	font = native.systemFont,
	fontSize = 16,
	emboss = true,
	onRelease = onRightAnswer
	}
 button1 = widget.newButton
{
	id = "button1",
	defaultFile = "buttonGray.png",
	overFile = "buttonBlue.png",
	label = "Example Answer 4",
	font = native.systemFont,
	fontSize = 16,
	emboss = true,
	onEvent = buttonHandler,
}
 button3 = widget.newButton
{
	id = "button4",
	defaultFile = "buttonGray.png",
	overFile = "buttonBlue.png",
	label = "Example Answer 4",
	font = native.systemFont,
	fontSize = 16,
	emboss = true,
	onEvent = buttonHandler,
}
 button4 = widget.newButton
{
	id = "button4",
	defaultFile = "buttonGray.png",
	overFile = "buttonBlue.png",
	label = "Example Answer 4",
	font = native.systemFont,
	fontSize = 16,
	emboss = true,
	onEvent = buttonHandler,
}
	button1.x = 160; button1.y = 240
	rightAnswer.x = 160; rightAnswer.y = 320
	button3.x = 160; button3.y = 400
	button4.x = 160; button4.y = 480
	
	-- all display objects must be inserted into group
	sceneGroup:insert( background )
	sceneGroup:insert( titleLogo )
	sceneGroup:insert( playBtn )
end

function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if phase == "will" then
		-- Called when the scene is still off screen and is about to move on screen
	elseif phase == "did" then
		-- Called when the scene is now on screen
		-- 
		-- INSERT code here to make the scene come alive
		-- e.g. start timers, begin animation, play audio, etc.
	end	
end

function scene:hide( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if event.phase == "will" then
		-- Called when the scene is on screen and is about to move off screen
		--
		-- INSERT code here to pause the scene
		-- e.g. stop timers, stop animation, unload sounds, etc.)
	elseif phase == "did" then
		-- Called when the scene is now off screen
	end	
end

function scene:destroy( event )
	local sceneGroup = self.view
	
	-- Called prior to the removal of scene's "view" (sceneGroup)
	-- 
	-- INSERT code here to cleanup the scene
	-- e.g. remove display objects, remove touch listeners, save state, etc.
	
	if rightAnswer then
		rightAnswer:removeSelf()	-- widgets must be manually removed
		rightAnswer = nil
		button1:removeSelf()	-- widgets must be manually removed
		button1 = nil
		button3:removeSelf()	-- widgets must be manually removed
		button3 = nil
		button4:removeSelf()	-- widgets must be manually removed
		button4 = nil
	end
end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene