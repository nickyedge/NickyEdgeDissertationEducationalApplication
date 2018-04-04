-----------------------------------------------------------------------------------------
--
-- question5.lua
-- By Nicky Edge
--
-----------------------------------------------------------------------------------------
-- include Corona's 'composer' library, allowing for scene creation
local composer = require("composer")
local scene = composer.newScene()
-----------------------------------------------------------------------------------------
local counter = 30

local function helpBtnPress(event)
	-- button listener for overlayHelpBtn
	score = score - 1
	scoreDisplay.text = score
	event.target.xScale = 0.95
	event.target.yScale = 0.95
	composer.showOverlay("question5Overlay", {effect = "fade", isModal = true})
end
 
-- timer function, displays a counter that counts down and when it hits 0 
-- the question is forfeit and the scene changes to the next question 
local function updateTimer(event)
    counter = counter - 1
    timeDisplay.text = counter
    if counter == 0 then
		score = score - 10
		timeDisplay:removeSelf()
		scoreDisplay:removeSelf()
		composer.removeScene("question5")
		composer.gotoScene("question6", "fade", 500)
    end
end

local countdown = timer.performWithDelay(1000, updateTimer, counter)

-- 'onRelease' button event listeners1
local function onRightAnswer(event)	
	-- go to question6.lua, add a point to score, and remove the timer
	score = score + 5
	scoreDisplay.text = score
	question5 = 1
	composer.removeScene("question5")
	composer.gotoScene("question6", "fade", 500)
end

local function onWrongAnswer1(event)
	-- go to question6.lua, take 5 points from score
	score = score - 5
	scoreDisplay.text = score
	question5 = 0
	composer.removeScene("question5")
	composer.gotoScene("question6", "fade", 500)
end

local function onWrongAnswer2(event)
	-- go to question6.lua, take 5 points from score
	score = score - 5
	scoreDisplay.text = score
	question5 = 0
	composer.removeScene("question5")
	composer.gotoScene("question6", "fade", 500)
end

function scene:create(event)
	local group = self.view
	-- display a background image
	local background = display.newImageRect ("background.jpg", display.actualContentWidth, display.actualContentHeight )
	background.anchorX = 0;background.anchorY = 0
	background.x = 0 + display.screenOriginX;background.y = 0 + display.screenOriginY
	
	local overlayHelpBtn = display.newImageRect ("help.png", 30, 30)
	overlayHelpBtn.destination = "overlayHelpBtn"
	overlayHelpBtn.x = 20;overlayHelpBtn.y = 200
	overlayHelpBtn:addEventListener ("tap", helpBtnPress)
	
	question = display.newText([[Question 5: If you receive an email 
	claiming to need your username 
	and/or password, what should you do?]], 0, 0, "Helvetica", 16)
	question:setTextColor(0,0,0)
	question.x = display.contentCenterX;question.y = 100
	
	answerOne = display.newText([[A. Report it as phishing/spam 
	through your email provider]], 0, 0, "Helvetica", 14)
	answerOne:setTextColor(0,0,0)
	answerOne.x = 160;answerOne.y = 255

	answerTwo = display.newText([[B. Delete the message]], 0, 0, "Helvetica", 14)
	answerTwo:setTextColor(0,0,0)
	answerTwo.x = 160;answerTwo.y = 330

	answerThree = display.newText([[C. Reply to the message with your 
	email and password]], 0, 0, "Helvetica", 14)
	answerThree:setTextColor(0,0,0)
	answerThree.x = 160;answerThree.y = 405
	
	wrongAnswer1 = display.newRect (0, 0, 280, 70)
	wrongAnswer1:setFillColor(1, 0.2, 0.2)
	wrongAnswer1.strokeWidth = 2    
    wrongAnswer1:setStrokeColor(black)
	wrongAnswer1.alpha = 1
	wrongAnswer1.isHitTestable = true
	wrongAnswer1.x = 160;wrongAnswer1.y = 330
	wrongAnswer1:addEventListener ("tap", onWrongAnswer1)
	
	rightAnswer = display.newRect (0, 0, 280, 70)
	rightAnswer:setFillColor(1, 0.2, 0.2)
	rightAnswer.strokeWidth = 2    
    rightAnswer:setStrokeColor(black)
	rightAnswer.alpha = 1
	rightAnswer.isHitTestable = true
	rightAnswer.x = 160;rightAnswer.y = 255
	rightAnswer:addEventListener ("tap", onRightAnswer)
	
	wrongAnswer2 = display.newRect (0, 0, 280, 70)
	wrongAnswer2:setFillColor(1, 0.2, 0.2)
	wrongAnswer2.strokeWidth = 2    
    wrongAnswer2:setStrokeColor(black)
	wrongAnswer2.alpha = 1
	wrongAnswer2.isHitTestable = true
	wrongAnswer2.x = 160;wrongAnswer2.y = 405
	wrongAnswer2:addEventListener ("tap", onWrongAnswer2)
	
	
	myTime = display.newText("Time:", 100, 200, native.systemFont, 16)
	myTime:setFillColor(1, 0, 0)
	myTime.x = 180;myTime.y = 200
	
	myScore = display.newText("Score:", 100, 200, native.systemFont, 16)
	myScore:setFillColor(1, 0, 0)
	myScore.x = 60;myScore.y = 200
	
	timeDisplay = display.newText(counter,0,0,native.systemFrontBold,32)
	timeDisplay:setFillColor(1, 0, 0)
	-- timer counter and 'time:' text display coordinates    
	timeDisplay.x = 260;timeDisplay.y = 200
	
	scoreDisplay = display.newText(score,0,0,native.systemFrontBold,32)
	scoreDisplay:setFillColor(1, 0, 0)
	-- score counter and 'score:' text display coordinates
	scoreDisplay.x = 120;scoreDisplay.y = 200
	
	-- all display objects must be inserted into scene group
	group:insert(background)
	group:insert(question)
	group:insert(timeDisplay)
	group:insert(scoreDisplay)
	group:insert(myTime)
	group:insert(myScore)
	group:insert(overlayHelpBtn)
	group:insert(rightAnswer)
	group:insert(wrongAnswer1)
	group:insert(wrongAnswer2)
	group:insert(answerOne)
	group:insert(answerTwo)
	group:insert(answerThree)
end

function scene:destroy(event)
	local sceneGroup = self.view
	-- remove objects from the scene, so they do not display in the next scene 
	-- i.e. buttons display from question 1 on question 2. removing them prevents this
	if (rightAnswer) then
			timer.cancel(countdown)
			timeDisplay:removeSelf()
			question:removeSelf()	
		elseif (wrongAnswer1)  then
			timer.cancel(countdown)
			timeDisplay:removeSelf()
			question:removeSelf()	
		elseif (wrongAnswer2) then
			timer.cancel(countdown)
			timeDisplay:removeSelf()
			question:removeSelf()	
	end
end
--------------------------------------------------------------------------------------
-- Scene event function listeners
--------------------------------------------------------------------------------------
scene:addEventListener("create", scene)
scene:addEventListener("destroy", scene)
--------------------------------------------------------------------------------------

return scene