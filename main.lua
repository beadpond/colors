--Use the code as you need
--COLORS IN GRAPHICS 2.0

local storyboard = require("storyboard")
storyboard.purgeOnSceneChange = true

display.setStatusBar(display.HiddenStatusBar)

-- most commonly used screen coordinates
centerX = display.contentCenterX
centerY = display.contentCenterY
screenLeft = display.screenOriginX
screenWidth = display.contentWidth - screenLeft * 2
screenRight = screenLeft + screenWidth
screenTop = display.screenOriginY
screenHeight = display.contentHeight - screenTop * 2
screenBottom = screenTop + screenHeight
display.contentWidth = screenWidth
display.contentHeight = screenHeight

storyboard.gotoScene ( "color" )
