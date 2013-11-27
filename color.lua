--Use as you desire, This is a tool
	
local storyboard = require( "storyboard" )
local scene = storyboard.newScene()
local widget = require( "widget" )

function scene:enterScene( event )
	local group = self.view

	local red = 0
	local green = 0
	local blue = 0
	local alpha = 1

	-- Background
	local bg = display.newRect( centerX, centerY, screenWidth, screenHeight )
	bg:setFillColor( 1, 1, 1)
	bg.alpha = 1
	group:insert( bg )
	
  -- Color Box
	local colorBox = display.newRect( centerX, centerY + 350, screenWidth-100, 200 )
	colorBox:setFillColor( red, green, blue, alpha )
	group:insert( colorBox )
	
	--  Text Objects
	local titleText = display.newText( "Use Sliders to adjust colors", 80, 300, native.systemFont, 30 )
	titleText:setFillColor(0,0,0,1)
	titleText.x = centerX
	titleText.y = screenHeight*0.05
	group:insert( titleText )

	local alphaText = display.newText( "Alpha", 80, 300, native.systemFont, 24 )
	alphaText:setFillColor(0,0,0,1)
	alphaText.x = 50
	alphaText.y = centerY - 220
	group:insert( alphaText )

	local redText = display.newText( "Red Slider Value: 0", 80, 300, native.systemFont, 24 )
	redText:setFillColor(1, 0, 0, 1)
	redText.x = centerX
	redText.y = screenHeight*.25
	group:insert( redText )

	local greenText = display.newText( "Green Slider Value: 0", 80, 300, native.systemFont, 24 )
	greenText:setFillColor(0, 0.5, 0, 1)
	greenText.x = centerX
	greenText.y = screenHeight*.45
	group:insert( greenText )

	local blueText = display.newText( "Blue Slider Value: 0", 80, 300, native.systemFont, 24 )
	blueText:setFillColor(0, 0, 0.5, 1)
	blueText.x = centerX
	blueText.y = screenHeight*.65
	group:insert( redText )

	-- The listener for our slider's
	local function sliderListener( event )
		local phase = event.phase
		
		if event.target.id == "Red Slider" then
			red = (event.value/100)
			redText.text = event.target.id .. " Value: " .. red
			print(red, green, blue, alpha)
		elseif event.target.id == "Green Slider" then
			green = (event.value/100)
			greenText.text = event.target.id .. " Value: " .. green
		elseif event.target.id == "Blue Slider" then
			blue = (event.value/100)
			blueText.text = event.target.id .. " Value: " .. blue
		elseif event.target.id == "Alpha Slider" then
			alpha = (event.value/100)
			print(alpha)
			--alphaText.text = event.target.id .. " Value: " .. alpha
		end
		
		colorBox:setFillColor(red, green, blue, alpha)
	end
	
	local horizontalSlider = widget.newSlider
	{
		left = centerX - 200,
		top = screenHeight*.2,
		width = 400,
		id = "Red Slider",
		value = 0,
		listener = sliderListener,
	}
	group:insert( horizontalSlider )

	local horizontalSlider = widget.newSlider
	{
		left = centerX - 200,
		top = screenHeight*.4,
		width = 400,
		id = "Green Slider",
		value = 0,
		listener = sliderListener,
	}
	group:insert( horizontalSlider )

	local horizontalSlider = widget.newSlider
	{
		left = centerX - 200,
		top = screenHeight*.6,
		width = 400,
		id = "Blue Slider",
		value = 0,
		listener = sliderListener,
	}
	group:insert( horizontalSlider )

	-- Create a vertical slider
	local verticalSlider = widget.newSlider
	{
		left = 20,
		top = centerY - 200,
		height = 400,
		id = "Alpha Slider",
		orientation = "vertical",
		value = 100,
		listener = sliderListener,
	}
	group:insert( verticalSlider )
end

scene:addEventListener( "enterScene", scene )

return scene
