-- 
-- Abstract: Button Events sample app, showing different button properties and handlers.
-- (Also demonstrates the use of external libraries.)
-- 
-- Version: 1.1
-- 
-- Sample code is MIT licensed, see https://www.coronalabs.com/links/code/license
-- Copyright (C) 2010 Corona Labs Inc. All Rights Reserved.

-- This example shows you how to create buttons in various ways by using the widget library.
-- The project folder contains additional button graphics in various colors.
--
-- Supports Graphics 2.0

-- Require the widget library
local widget = require( "widget" )

local background = display.newImage("carbonfiber.jpg", true) -- flag overrides large image downscaling
background.x = display.contentWidth / 2
background.y = display.contentHeight / 2

local roundedRect = display.newRoundedRect( 10, 50, 300, 40, 8 )
roundedRect.anchorX, roundedRect.anchorY = 0.0, 0.0 	-- simulate TopLeft alignment
roundedRect:setFillColor( 0/255, 0/255, 0/255, 90/255 )

local t = display.newText( "Waiting for button event...", 0, 0, native.systemFont, 18 )
t.x, t.y = display.contentCenterX, 70
-------------------------------------------------------------------------------
-- Create 5 buttons, using different optional attributes
-------------------------------------------------------------------------------


-- These are the functions triggered by the buttons

local buttonHandler = function( event )
	t.text = "id = " .. event.target.id .. ", phase = " .. event.phase
end


-- These other four buttons share a single event handler function, identifying themselves by "id"
-- Note that if a general "onEvent" handler is assigned, it overrides the "onPress" and "onRelease" handling

-- Also, some label fonts may appear vertically offset in the Simulator, but not on device, due to
-- different device font rendering. The button object has an optional "offset" property for minor
-- vertical adjustment to the label position, if necessary (example: offset = -2)
 button1 = widget.newButton
{
	id = "button1",
	defaultFile = "buttonGray.png",
	overFile = "buttonBlue.png",
	label = "Example Answer 1",
	font = native.systemFont,
	fontSize = 16,
	emboss = true,
	onEvent = buttonHandler,
}

 button2 = widget.newButton
{
	id = "button2",
	defaultFile = "buttonGray.png",
	overFile = "buttonBlue.png",
	label = "Example Answer 2",
	font = native.systemFont,
	fontSize = 16,
	emboss = true,
	onEvent = buttonHandler,
}

 button3 = widget.newButton
{
	id = "button3",
	defaultFile = "buttonGray.png",
	overFile = "buttonBlue.png",
	label = "Example Answer 3",
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
button2.x = 160; button2.y = 320
button3.x = 160; button3.y = 400
button4.x = 160; button4.y = 480
