local composer = require("composer")
local scene = composer.newScene()
 
local function hideOverlay(event)
	composer.hideOverlay("fade", 800) 
end
 
-- Called when the scene's view does not exist:
function scene:create(event)
	local group = self.view
 
 	local exitBtn = display.newRect(group, 0, 0, 50, 20)
	exitBtn:setFillColor(1, 0.2, 0.2)
	exitBtn.strokeWidth = 2    
    exitBtn:setStrokeColor(black)
	exitBtn.alpha = 1
	exitBtn.isHitTestable = true
	exitBtn.x = display.contentCenterX;exitBtn.y = 520
	exitBtn:addEventListener ("tap", hideOverlay)
 
	local backgroundOverlay = display.newRect(group, 0, 0, 310, 314)
	backgroundOverlay:setFillColor(black)
	backgroundOverlay.strokeWidth = 2    
    backgroundOverlay:setStrokeColor(1, 0.2, 0.2)
	backgroundOverlay.alpha = 1
	backgroundOverlay.x = display.contentCenterX;backgroundOverlay.y = 380
		
	local instructions = display.newText([[Once the 'play' button 
	has been pressed,then the game 
	will begin. You will be asked a series
	of computer security questions, 
	these questions will be timed,
	a score will be in place to determine 
	how you do during the quiz.
	
	A help button is located to the left 
	of the score on each question.
	This will contain information if you 
	are struggling with a question.]], 0, 0, "Helvetica", 18)
	instructions:setTextColor(255,255,255)
	instructions.x = 170;instructions.y = 370
	
	local instructionsExit = display.newText("close", 0, 0, "Helvetica", 18)
	instructionsExit:setTextColor(0, 0, 0, 255)
	instructionsExit.x = display.contentCenterX;instructionsExit.y = 520
	
	group:insert(backgroundOverlay)
	group:insert(exitBtn)
	group:insert(instructionsExit)	
	group:insert(instructions)	
end
 
scene:addEventListener("create", scene)
---------------------------------------------------------------------------------
 
return scene