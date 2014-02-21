-- 
-- Project: EndlessScroller
--
-- Description: Example of endless scrolling through
-- a cavern
--
-- Version: 0.1
--
-- Copyright 2013 Doug Davies. All Rights Reserved.
-- MIT License. Feel free to use this however you want!
-- https://github.com/csddavies
-- http://www.funkyvisions.com
--

local physics = require("physics")	
local walls = require("walls")

-- Constants

local _W = display.contentWidth
local _H = display.contentHeight

local WALL_WIDTH = 64   -- HOW WIDE EACH WALL SEGMENT IS
local NUM_WALLS = 100   -- NUMBER OF WALLS IN LOOP
local WALL_SPEED = 10   -- HOW FAST TO MOVE THE WALLS (YOU CAN INCREASE THIS DYNAMICALLY IF YOU WANT)
local BUFFER = 100      -- HOW MUCH OFF-SCREEN BUFFER TO USE
local DIFFICULTY = 4    -- HOW OFTEN WALL IS SPAWNED (DON'T MAKE SMALLER THAN 3)

-- Hide the statusbar

display.setStatusBar( display.HiddenStatusBar )

-- Setup the spritesheet images

local wallSheetOptions =
{
	frames = walls,
    sheetContentWidth = 1024,
    sheetContentHeight = 500
}

local wallSheet = graphics.newImageSheet( "walls.png", wallSheetOptions )

local topWalls = {}
local bottomWalls = {}
local wallIndex = 0

local wallGroup = display.newGroup()

local spawnWall = function(x)
	
	wallIndex = wallIndex + 1
	
	-- start over (skip intro wall)
	
	if (topWalls[wallIndex] == nil) then
		wallIndex = 2
	end
	
	local topWall = display.newImage( wallGroup, wallSheet, topWalls[wallIndex] )
	topWall.anchorX = 0.5; topWall.anchorY = 0.0;
	topWall.x = x; topWall.y = - 30;
	topWall.type = topWalls[wallIndex]

	local bottomWall = display.newImage( wallGroup, wallSheet, bottomWalls[wallIndex] )
	bottomWall.anchorX = 0.5; bottomWall.anchorY = 1.0;
	bottomWall.x = x; bottomWall.y = _H + 30;
	bottomWall.type = bottomWalls[wallIndex]

	local topShape = wallSheetOptions.frames[topWalls[wallIndex]].shape
	physics.addBody( topWall, "static", { shape=topShape } )

	local bottomShape = wallSheetOptions.frames[bottomWalls[wallIndex]].shape
	physics.addBody( bottomWall, "static", { shape=bottomShape } )
	
end

local initWalls = function()

	local x
	for x = _W + BUFFER, 2*(_W + BUFFER) + BUFFER, 64 do
		spawnWall(x)
	end
	
end

local generateWalls = function()
	
	-- INTRO_WALL
	topWalls[1] = walls.INTRO_WALL_TOP
	bottomWalls[1] = walls.INTRO_WALL_BOTTOM

	-- NORMAL_WALLS
	local i
	for i = 2, NUM_WALLS, 1 do
		topWalls[i] = walls.NORMAL_WALL_TOP
		bottomWalls[i] = walls.NORMAL_WALL_BOTTOM
	end
	
	-- RANDOM WALLS
	for i = 3, NUM_WALLS - 2, 1 do
		
		if (i % DIFFICULTY == 0) then
			
			local r = math.random(0, 7)
			
			if (r == 0) then
				topWalls[i-1] = walls.LOW_WALL_LEFT_TOP
				topWalls[i] = walls.LOW_WALL_MIDDLE_TOP
				topWalls[i+1] = walls.LOW_WALL_RIGHT_TOP
			elseif (r == 1) then
				bottomWalls[i-1] = walls.LOW_WALL_LEFT_BOTTOM
				bottomWalls[i] = walls.LOW_WALL_MIDDLE_BOTTOM
				bottomWalls[i+1] = walls.LOW_WALL_RIGHT_BOTTOM
			elseif (r == 2) then
				topWalls[i-1] = walls.MEDIUM_WALL_LEFT_TOP
				topWalls[i] = walls.MEDIUM_WALL_MIDDLE_TOP
				topWalls[i+1] = walls.MEDIUM_WALL_RIGHT_TOP
			elseif (r == 3) then
				bottomWalls[i-1] = walls.MEDIUM_WALL_LEFT_BOTTOM
				bottomWalls[i] = walls.MEDIUM_WALL_MIDDLE_BOTTOM
				bottomWalls[i+1] = walls.MEDIUM_WALL_RIGHT_BOTTOM
			elseif (r == 4) then
				topWalls[i-1] = walls.HIGH_WALL_LEFT_TOP
				topWalls[i] = walls.HIGH_WALL_MIDDLE_TOP
				topWalls[i+1] = walls.HIGH_WALL_RIGHT_TOP
			elseif (r == 5) then
				bottomWalls[i-1] = walls.HIGH_WALL_LEFT_BOTTOM
				bottomWalls[i] = walls.HIGH_WALL_MIDDLE_BOTTOM
				bottomWalls[i+1] = walls.HIGH_WALL_RIGHT_BOTTOM
			elseif (r == 6) then
				topWalls[i-1] = walls.XHIGH_WALL_LEFT_TOP
				topWalls[i] = walls.XHIGH_WALL_MIDDLE_TOP
				topWalls[i+1] = walls.XHIGH_WALL_RIGHT_TOP
			elseif (r == 7) then
				bottomWalls[i-1] = walls.XHIGH_WALL_LEFT_BOTTOM
				bottomWalls[i] = walls.XHIGH_WALL_MIDDLE_BOTTOM
				bottomWalls[i+1] = walls.XHIGH_WALL_RIGHT_BOTTOM
			end			

		end
	
	end

end
	
local gameLoop = function()
	
	-- MOVE THE WALLS
	
	local type = -1		

	local i
	for i = wallGroup.numChildren,1,-1 do
		local object = wallGroup[i]
		if object ~= nil and object.y ~= nil then
			object:translate(-WALL_SPEED, 0)
			if object.x < -BUFFER then
				type = object.type
				display.remove(object); object = nil;
			end
		end
	end
			
	-- if wall was removed then add a new one right after the last child's position

	if (type ~= -1 and wallGroup.numChildren > 0) then
		
		local xPos = wallGroup[wallGroup.numChildren].x + WALL_WIDTH
		spawnWall(xPos)
		
	end

end

-- Start physics

physics.start()
physics.setGravity( 0, 20 ) 
--physics.setDrawMode( "hybrid" )

-- Pre-Generate Walls

generateWalls()

-- Add the first batch of walls to the display (off-screen)

initWalls()

-- Add ball with distance anchor so it stays on screen

local anchor = display.newCircle( _W * 0.5, _H * 0.5, 1 )
anchor.isVisible = false
physics.addBody( anchor, "static", { radius=1 } )
local ball = display.newCircle( _W * 0.7, _H * 0.7, 40 )
physics.addBody( ball, "dynamic", { radius=40 } )
local joint = physics.newJoint ( "distance", ball, anchor, ball.x, ball.y, anchor.x, anchor.y )

-- Add our game loop event handler

Runtime:addEventListener("enterFrame", gameLoop)
			


