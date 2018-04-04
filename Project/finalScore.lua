-----------------------------------------------------------------------------------------
--
-- finalScore.lua
--
-----------------------------------------------------------------------------------------

local composer = require("composer")
local scene = composer.newScene()

-----------------------------------------------------------------------------------------
local function menuButtonPress(event)	
	-- go to menu.lua scene
	score = 0
	composer.removeScene("finalScore")
	composer.gotoScene( "menu", "crossFade", 500)
	
	return true	-- indicates successful touch
end

function scene:create(event)
	local sceneGroup = self.view

	-- display a background image
	local background = display.newImageRect("background.jpg", display.actualContentWidth, display.actualContentHeight)
	background.anchorX = 0;background.anchorY = 0
	background.x = 0 + display.screenOriginX;background.y = 0 + display.screenOriginY
	
	local menuButton = display.newImageRect ("play.png", 85, 19)
	menuButton.destination = "menuButton"
	menuButton.x = display.contentCenterX;menuButton.y = 440
	menuButton:addEventListener ("tap", menuButtonPress)
	
	question1Correct = display.newText([[Q1: Correct!]], 0, 0, "Helvetica", 18)
	question1Correct:setFillColor(0, 1, 0)
	question1Correct.x = display.contentCenterX;question1Correct.y = 60
	
	question1Incorrect = display.newText([[Q1: Incorrect!]], 0, 0, "Helvetica", 18)
	question1Incorrect:setFillColor(1, 0, 0)
	question1Incorrect.x = display.contentCenterX;question1Incorrect.y = 60
	
	question2Correct = display.newText([[Q2: Correct!]], 0, 0, "Helvetica", 18)
	question2Correct:setFillColor(0, 1, 0)
	question2Correct.x = display.contentCenterX;question2Correct.y = 80
	
	question2Incorrect = display.newText([[Q2: Incorrect!]], 0, 0, "Helvetica", 18)
	question2Incorrect:setFillColor(1, 0, 0)
	question2Incorrect.x = display.contentCenterX;question2Incorrect.y = 80
	
	question3Correct = display.newText([[Q3: Correct!]], 0, 0, "Helvetica", 18)
	question3Correct:setFillColor(0, 1, 0)
	question3Correct.x = display.contentCenterX;question3Correct.y = 100
	
	question3Incorrect = display.newText([[Q3: Incorrect!]], 0, 0, "Helvetica", 18)
	question3Incorrect:setFillColor(1, 0, 0)
	question3Incorrect.x = display.contentCenterX;question3Incorrect.y = 100
	
	question4Correct = display.newText([[Q4: Correct!]], 0, 0, "Helvetica", 18)
	question4Correct:setFillColor(0, 1, 0)
	question4Correct.x = display.contentCenterX;question4Correct.y = 120
	
	question4Incorrect = display.newText([[Q4: Incorrect!]], 0, 0, "Helvetica", 18)
	question4Incorrect:setFillColor(1, 0, 0)
	question4Incorrect.x = display.contentCenterX;question4Incorrect.y = 120
	
	question5Correct = display.newText([[Q5: Correct!]], 0, 0, "Helvetica", 18)
	question5Correct:setFillColor(0, 1, 0)
	question5Correct.x = display.contentCenterX;question5Correct.y = 140
	
	question5Incorrect = display.newText([[Q5: Incorrect!]], 0, 0, "Helvetica", 18)
	question5Incorrect:setFillColor(1, 0, 0)
	question5Incorrect.x = display.contentCenterX;question5Incorrect.y = 140
	
	question6Correct = display.newText([[Q6: Correct!]], 0, 0, "Helvetica", 18)
	question6Correct:setFillColor(0, 1, 0)
	question6Correct.x = display.contentCenterX;question6Correct.y = 160
	
	question6Incorrect = display.newText([[Q6: Incorrect!]], 0, 0, "Helvetica", 18)
	question6Incorrect:setFillColor(1, 0, 0)
	question6Incorrect.x = display.contentCenterX;question6Incorrect.y = 160
	
	question7Correct = display.newText([[Q7: Correct!]], 0, 0, "Helvetica", 18)
	question7Correct:setFillColor(0, 1, 0)
	question7Correct.x = display.contentCenterX;question7Correct.y = 180
	
	question7Incorrect = display.newText([[Q7: Incorrect!]], 0, 0, "Helvetica", 18)
	question7Incorrect:setFillColor(1, 0, 0)
	question7Incorrect.x = display.contentCenterX;question7Incorrect.y = 180
	
	question8Correct = display.newText([[Q8: Correct!]], 0, 0, "Helvetica", 18)
	question8Correct:setFillColor(0, 1, 0)
	question8Correct.x = display.contentCenterX;question8Correct.y = 200
	
	question8Incorrect = display.newText([[Q8: Incorrect!]], 0, 0, "Helvetica", 18)
	question8Incorrect:setFillColor(1, 0, 0)
	question8Incorrect.x = display.contentCenterX;question8Incorrect.y = 200
	
	question9Correct = display.newText([[Q9: Correct!]], 0, 0, "Helvetica", 18)
	question9Correct:setFillColor(0, 1, 0)
	question9Correct.x = display.contentCenterX;question9Correct.y = 220
	
	question9Incorrect = display.newText([[Q9: Incorrect!]], 0, 0, "Helvetica", 18)
	question9Incorrect:setFillColor(1, 0, 0)
	question9Incorrect.x = display.contentCenterX;question9Incorrect.y = 220
	
	question10Correct = display.newText([[Q10: Correct!]], 0, 0, "Helvetica", 18)
	question10Correct:setFillColor(0, 1, 0)
	question10Correct.x = display.contentCenterX;question10Correct.y = 240
	
	question10Incorrect = display.newText([[Q10: Incorrect!]], 0, 0, "Helvetica", 18)
	question10Incorrect:setFillColor(1, 0, 0)
	question10Incorrect.x = display.contentCenterX;question10Incorrect.y = 240
	
	scoreMsg1 = display.newText([[Well done! Thanks for playing!
	
	Your score is: ]], 0, 0, "Helvetica", 18)
	scoreMsg1:setFillColor(1, 0, 0)
	scoreMsg1.x = display.contentCenterX;scoreMsg1.y = 340

	scoreMsg2 = display.newText([[Good job! Thanks for playing!
	
	Your score is:]], 0, 0, "Helvetica", 18)
	scoreMsg2:setFillColor(1, 0, 0)
	scoreMsg2.x = display.contentCenterX;scoreMsg2.y = 340
	
	scoreMsg3 = display.newText([[Try again! Thanks for playing!
	
	your score is:]], 0, 0, "Helvetica", 18)
	scoreMsg3:setFillColor(1, 0, 0)
	scoreMsg3.x = display.contentCenterX;scoreMsg3.y = 340
		
	scoreDisplay = display.newText(score,0,0,native.systemFrontBold,32)
	scoreDisplay:setFillColor(1, 0, 0)
	-- score counter and 'score:' text display coordinates
	scoreDisplay.x = 180;scoreDisplay.y = 360
	
	-- all display objects must be inserted into group
	sceneGroup:insert(background)
	sceneGroup:insert(scoreDisplay)
	sceneGroup:insert(scoreMsg1)
	sceneGroup:insert(scoreMsg2)	
	sceneGroup:insert(scoreMsg3)
	sceneGroup:insert(question1Correct)
	sceneGroup:insert(question1Incorrect)
	sceneGroup:insert(question2Correct)
	sceneGroup:insert(question2Incorrect)
	sceneGroup:insert(question3Correct)
	sceneGroup:insert(question3Incorrect)
	sceneGroup:insert(question4Correct)
	sceneGroup:insert(question4Incorrect)
	sceneGroup:insert(question5Correct)
	sceneGroup:insert(question5Incorrect)
	sceneGroup:insert(question6Correct)
	sceneGroup:insert(question6Incorrect)
	sceneGroup:insert(question7Correct)
	sceneGroup:insert(question7Incorrect)
	sceneGroup:insert(question8Correct)
	sceneGroup:insert(question8Incorrect)
	sceneGroup:insert(question9Correct)
	sceneGroup:insert(question9Incorrect)
	sceneGroup:insert(question10Correct)
	sceneGroup:insert(question10Incorrect)
	sceneGroup:insert(menuButton)
end

-- show()
function scene:show(event)
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if (phase == "will") then
	
		if (question1 == 1) then
				question1Incorrect:removeSelf()
			elseif (question1 == 0) then
				question1Correct:removeSelf()
		end
	
		if (question2 == 1) then
				question2Incorrect:removeSelf()
			elseif (question2 == 0) then
				question2Correct:removeSelf()
		end
		
		if (question3 == 1) then
				question3Incorrect:removeSelf()
			elseif (question3 == 0) then
				question3Correct:removeSelf()
		end
	
		if (question4 == 1) then
				question4Incorrect:removeSelf()
			elseif (question4 == 0) then
				question4Correct:removeSelf()
		end
		
		if (question5 == 1) then
				question5Incorrect:removeSelf()
			elseif (question5 == 0) then
				question5Correct:removeSelf()
		end
	
		if (question6 == 1) then
				question6Incorrect:removeSelf()
			elseif (question6 == 0) then
				question6Correct:removeSelf()
		end
		
		if (question7 == 1) then
				question7Incorrect:removeSelf()
			elseif (question7 == 0) then
				question7Correct:removeSelf()
		end
	
		if (question8 == 1) then
				question8Incorrect:removeSelf()
			elseif (question8 == 0) then
				question8Correct:removeSelf()
		end
		
		if (question9 == 1) then
				question9Incorrect:removeSelf()
			elseif (question9 == 0) then
				question9Correct:removeSelf()
		end
	
		if (question10 == 1) then
				question10Incorrect:removeSelf()
			elseif (question10 == 0) then
				question10Correct:removeSelf()
		end
	
		if (score >= 40 and score <= 50) then
				scoreMsg2:removeSelf()
				scoreMsg3:removeSelf()
			elseif (score >= 29 and score <= 39) then
				scoreMsg1:removeSelf()
				scoreMsg3:removeSelf()
			else
				scoreMsg1:removeSelf()
				scoreMsg2:removeSelf()
		end
    end
end
---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener("create", scene)
scene:addEventListener("show", scene)
-----------------------------------------------------------------------------------------

return scene