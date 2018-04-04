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
	exitBtn.x = display.contentCenterX;exitBtn.y = 507
	exitBtn:addEventListener ("tap", hideOverlay)
 
	local backgroundOverlay = display.newRect(group, 0, 0, 310, 300)
	backgroundOverlay:setFillColor(black)
	backgroundOverlay.strokeWidth = 2    
    backgroundOverlay:setStrokeColor(1, 0.2, 0.2)
	backgroundOverlay.alpha = 1
	backgroundOverlay.x = display.contentCenterX;backgroundOverlay.y = 370
	
	local helpInfo = display.newText( [[If you do not protect your computer 
	it can be used by hackers to spread 
	viruses and other threats. 
	
	You should always be conscious of 
	your actions, you can put yourself 
	and others at risk.
	
	Please follow any safety instructions
	given with your device. and think
	carefully about your actions.]], 0, 0, "Helvetica", 18 )
	helpInfo:setTextColor(255,255,255)
	helpInfo.x = 170;helpInfo.y = 370
	
	local helpExit = display.newText("close", 0, 0, "Helvetica", 18)
	helpExit:setTextColor(0, 0, 0, 255)
	helpExit.x = display.contentCenterX;helpExit.y = 507
	
	group:insert(backgroundOverlay)
	group:insert(exitBtn)	
	group:insert(helpInfo)
	group:insert(helpExit)
end
 
scene:addEventListener("create", scene)
---------------------------------------------------------------------------------
 
return scene