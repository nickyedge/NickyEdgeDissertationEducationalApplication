-----------------------------------------------------------------------------------------
--
-- question1.lua
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
local counter = 10
local timeDisplay = display.newText(counter,0,0,native.systemFrontBold,64)
    
timeDisplay.x = display.contentCenterX
timeDisplay.y = 100
 
local function updateTimer(event)
    counter = counter - 1
    timeDisplay.text = counter
    if counter == 0 then
		timeDisplay:removeSelf()
		counter = nil
		composer.gotoScene( "question2", "fade", 500 )
    end
end
 
timer.performWithDelay(1000, updateTimer, counter)

-- 'onRelease' button event listeners1
local function onRightAnswer()	
	-- go to question2.lua and remove the timer
	timeDisplay:removeSelf()
	counetr = nil
	composer.gotoScene( "question2", "fade", 500 )

	return true	-- indicates successful touch
end

local function onWrongAnswer1()
	-- hide wrong answer once pressed
	wrongAnswer1.isVisible = false
	wrongAnswer1 = nil	

	return true	-- indicates successful touch
end

local function onWrongAnswer2()
	-- hide wrong answer once pressed
	wrongAnswer2.isVisible = false
	wrongAnswer2 = nil	

	return true	-- indicates successful touch
end

local function onWrongAnswer3()
	-- hide wrong answer once pressed
	wrongAnswer3.isVisible = false
	wrongAnswer3 = nil	

	return true	-- indicates successful touch
end


function scene:create( event )
	local sceneGroup = self.view
	-- display a background image
	local background = display.newImageRect( "background.jpg", display.actualContentWidth, display.actualContentHeight )
	background.anchorX = 0
	background.anchorY = 0
	background.x = 0 + display.screenOriginX 
	background.y = 0 + display.screenOriginY

	-- create a widget button (which will load the next scene on release)
	rightAnswer = widget.newButton
	{
		id = "rightAnswer",
		defaultFile = "buttonGray.png",
		overFile = "buttonBlue.png",
		label = "Right Answer",
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
		label = "Wrong Answer",
		font = native.systemFont,
		fontSize = 16,
		emboss = true,
		onRelease = onWrongAnswer1
	}
	 wrongAnswer2 = widget.newButton
	{
		id = "wrongAnswer2",
		defaultFile = "buttonGray.png",
		overFile = "buttonBlue.png",
		label = "Wrong Answer",
		font = native.systemFont,
		fontSize = 16,
		emboss = true,
		onRelease = onWrongAnswer2
	}
	 wrongAnswer3 = widget.newButton
	{
		id = "wrongAnswer3",
		defaultFile = "buttonGray.png",
		overFile = "buttonBlue.png",
		label = "Wrong Answer",
		font = native.systemFont,
		fontSize = 16,
		emboss = true,
		onRelease = onWrongAnswer3
	}
	wrongAnswer1.x = 160;wrongAnswer1.y = 240
	rightAnswer.x = 160; rightAnswer.y = 320
	wrongAnswer2.x = 160; wrongAnswer2.y = 400
	wrongAnswer3.x = 160; wrongAnswer3.y = 480
	
	-- all display objects must be inserted into group
	sceneGroup:insert( background )
	sceneGroup:insert( rightAnswer )
	sceneGroup:insert( wrongAnswer1 )
	sceneGroup:insert( wrongAnswer2 )
	sceneGroup:insert( wrongAnswer3 )
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
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene