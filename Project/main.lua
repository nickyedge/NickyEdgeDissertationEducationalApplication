-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- hide the status bar
display.setStatusBar( display.HiddenStatusBar )

-- include the Corona "composer" module
local composer = require "composer"

-- global variables
score = 0
-- data gathering testing variables
question1 = 0
question2 = 0
question3 = 0
question4 = 0
question5 = 0
question6 = 0
question7 = 0
question8 = 0
question9 = 0
question10 = 0

-- load menu screen
composer.gotoScene( "menu" )