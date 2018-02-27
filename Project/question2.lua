-----------------------------------------------------------------------------------------
--
-- question1.lua
-- By Nicky Edge
--
-----------------------------------------------------------------------------------------
-- include Corona's 'composer' library, allowing for scene creation
local composer = require( "composer" )
local scene = composer.newScene()

-- include Corona's "widget" library
local widget = require "widget"
-----------------------------------------------------------------------------------------

-- forward declarations and other locals
local rightAnswer
local wrongAnswer1
local wrongAnswer2
local wrongAnswer3
local counter = 10
local timeDisplay = display.newText(counter,0,0,native.systemFrontBold,32)

-- timer counter display coordinates    
timeDisplay.x = display.contentCenterX
timeDisplay.y = 100
 
-- timer function, displays a counter that counts down and when it hits 0 
-- the question is forfeit and the scene changes to the next question 
local function updateTimer(event)
    counter = counter - 1
    timeDisplay.text = counter
    if counter == 0 then
		timeDisplay:removeSelf()
		composer.gotoScene( "question2", "fade", 500 )
    end
end
 
 -- timer update delay, ensures the timer ticks every second
 timer.performWithDelay(1000, updateTimer, counter)

-- 'onRelease' button event listeners1
local function onRightAnswer()	
	-- go to question2.lua, add a point to score, and remove the timer
	score = score + 1
	scoreDisplay.text = score
	timeDisplay:removeSelf()
	composer.gotoScene( "question2", "fade", 500 )

	return true	-- indicates successful touch
end

local function onWrongAnswer1()
	-- hide wrong answer once pressed, and take away a point from the score
	score = score - 1
	scoreDisplay.text = score
	wrongAnswer1.isVisible = false

	return true	-- indicates successful touch
end

local function onWrongAnswer2()
	-- hide wrong answer once pressed, and take away a point from the score
	score = score - 1
	scoreDisplay.text = score
	wrongAnswer2.isVisible = false	

	return true	-- indicates successful touch
end

local function onWrongAnswer3()
	-- hide wrong answer once pressed, and take away a point from the score
	score = score - 1
	scoreDisplay.text = score
	wrongAnswer3.isVisible = false

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
	-- button placement coordinates
	wrongAnswer1.x = 160;wrongAnswer1.y = 240
	rightAnswer.x = 160; rightAnswer.y = 300
	wrongAnswer2.x = 160; wrongAnswer2.y = 360
	wrongAnswer3.x = 160; wrongAnswer3.y = 420
	
	-- all display objects must be inserted into scene group
	sceneGroup:insert( background )
	sceneGroup:insert( rightAnswer )
	sceneGroup:insert( wrongAnswer1 )
	sceneGroup:insert( wrongAnswer2 )
	sceneGroup:insert( wrongAnswer3 )
end

function scene:destroy( event )
	local sceneGroup = self.view
	-- remove objects from the scene, so they do not display in the next scene 
	-- i.e. buttons display from question 1 on question 2. removing them prevents this
	if rightAnswer then
		-- widgets, i.e. the buttons must be manually removed
		rightAnswer:removeSelf()
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

-- listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene