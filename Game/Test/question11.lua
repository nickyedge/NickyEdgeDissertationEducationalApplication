-----------------------------------------------------------------------------------------
--
-- question11.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

-- include Corona's "widget" library
local widget = require "widget"

--------------------------------------------

-- forward declarations and other locals
local rightAnswer
local wrongAnswer1
local wrongAnswer2
local wrongAnswer3


-- 'onRelease' event listener for playBtn
local function onRightAnswer()
	
	-- go to level1.lua scene
	composer.gotoScene( "question12", "fade", 500 )

	return true	-- indicates successful touch
end

local function onWrongAnswerAnswer1()
	
	wrongAnswer1.isVisible = false
	wrongAnswer1 = nil	

	return true	-- indicates successful touch
end

local function onWrongAnswerAnswer2()
	
	wrongAnswer2.isVisible = false
	wrongAnswer2 = nil	

	return true	-- indicates successful touch
end

local function onWrongAnswerAnswer3()
	
	wrongAnswer3.isVisible = false
	wrongAnswer3 = nil	

	return true	-- indicates successful touch
end


function scene:create( event )
	local sceneGroup = self.view

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
	wrongAnswer1 = widget.newButton
	{
		id = "wrongAnswer1",
		defaultFile = "buttonGray.png",
		overFile = "buttonBlue.png",
		label = "Example Answer 4",
		font = native.systemFont,
		fontSize = 16,
		emboss = true,
		onRelease = onWrongAnswerAnswer1
	}
	 wrongAnswer2 = widget.newButton
	{
		id = "wrongAnswer2",
		defaultFile = "buttonGray.png",
		overFile = "buttonBlue.png",
		label = "Example Answer 4",
		font = native.systemFont,
		fontSize = 16,
		emboss = true,
		onRelease = onWrongAnswerAnswer2
	}
	 wrongAnswer3 = widget.newButton
	{
		id = "wrongAnswer3",
		defaultFile = "buttonGray.png",
		overFile = "buttonBlue.png",
		label = "Example Answer 4",
		font = native.systemFont,
		fontSize = 16,
		emboss = true,
		onRelease = onWrongAnswerAnswer3
	}
	wrongAnswer1.x = 160;wrongAnswer1.y = 240
	rightAnswer.x = 160; rightAnswer.y = 320
	wrongAnswer2.x = 160; wrongAnswer2.y = 400
	wrongAnswer3.x = 160; wrongAnswer3.y = 480
	
	-- all display objects must be inserted into group
	sceneGroup:insert( rightAnswer )
	sceneGroup:insert( wrongAnswer1 )
	sceneGroup:insert( wrongAnswer2 )
	sceneGroup:insert( wrongAnswer3 )
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
		wrongAnswer1:removeSelf()
		wrongAnswer1 = nil
		wrongAnswer2:removeSelf()
		wrongAnswer2 = nil
		wrongAnswer3:removeSelf()
		wrongAnswer3 = nil		
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
