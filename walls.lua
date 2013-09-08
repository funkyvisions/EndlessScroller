local walls =
{
	NORMAL_WALL_TOP = 1,
	NORMAL_WALL_BOTTOM = 2,
	INTRO_WALL_TOP = 3,
	INTRO_WALL_BOTTOM = 4,
	EXIT_WALL_TOP = 5,
	EXIT_WALL_BOTTOM = 6,
	LOW_WALL_LEFT_TOP = 7,
	LOW_WALL_MIDDLE_TOP = 8,
	LOW_WALL_RIGHT_TOP = 9,
	LOW_WALL_LEFT_BOTTOM = 10,
	LOW_WALL_MIDDLE_BOTTOM = 11,
	LOW_WALL_RIGHT_BOTTOM = 12,
	MEDIUM_WALL_LEFT_TOP = 13,
	MEDIUM_WALL_MIDDLE_TOP = 14,
	MEDIUM_WALL_RIGHT_TOP = 15,
	MEDIUM_WALL_LEFT_BOTTOM = 16,
	MEDIUM_WALL_MIDDLE_BOTTOM = 17,
	MEDIUM_WALL_RIGHT_BOTTOM = 18,
	HIGH_WALL_LEFT_TOP = 19,
	HIGH_WALL_MIDDLE_TOP = 20,
	HIGH_WALL_RIGHT_TOP = 21,
	HIGH_WALL_LEFT_BOTTOM = 22,
	HIGH_WALL_MIDDLE_BOTTOM = 23,
	HIGH_WALL_RIGHT_BOTTOM = 24,
	XHIGH_WALL_LEFT_TOP = 25,
	XHIGH_WALL_MIDDLE_TOP = 26,
	XHIGH_WALL_RIGHT_TOP = 27,
	XHIGH_WALL_LEFT_BOTTOM = 28,
	XHIGH_WALL_MIDDLE_BOTTOM = 29,
	XHIGH_WALL_RIGHT_BOTTOM = 30,

	-- NORMAL_WALL_TOP
	{
		x=0, y=0,
		width=64, height=64,
		shape = {-32, -32, 32, -32, 32, 25, -32, 25}
	},
	
	-- NORMAL_WALL_BOTTOM
	{
		x=0, y=0+64+10,
		width=64, height=64,
		shape = {-32, -25, 32, -25, 32, 32, -32, 32} 
	},
	
	-- INTRO_WALL_TOP
	{
		x=0, y=148,
		width=64, height=64,
		shape = {-32, -32, 32, -32, 32, 25, -32, 10} 
	},
	
	-- INTRO_WALL_BOTTOM
	{
		x=0, y=148+64+10,
		width=64, height=64,
		shape = {-32, -10, 32, -25, 32, 32, -32, 32} 
	},
	
	-- EXIT_WALL_TOP
	{
		x=0, y=296,
		width=64, height=64,
		shape = {-32, -32, 32, -32, 32, 10, -32, 25} 
	},
	
	-- EXIT_WALL_BOTTOM
	{
		x=0, y=296+64+10,
		width=64, height=64,
		shape = {-32, -25, 32, -10, 32, 32, -32, 32} 
	},
	
	-- LOW_WALL_LEFT_TOP
	{
		x=74, y=0,
		width=64, height=128,
		shape = {-32, -64, 32, -64, 32, 45, -32, -10} 
	},
	
	-- LOW_WALL_MIDDLE_TOP
	{
		x=74+1*64, y=0,
		width=64, height=128,
		shape = {-32, -64, 32, -64, 32, 45, -32, 45} 
	},

	-- LOW_WALL_RIGHT_TOP
	{
		x=74+2*64, y=0,
		width=64, height=128,
		shape = {-32, -64, 32, -64, 32, -10, -32, 45} 
	},

	-- LOW_WALL_LEFT_BOTTOM
	{
		x=74, y=0+128+10,
		width=64, height=128,
		shape = {-32, 10, 32, -45, 32, 64, -32, 64} 
	},
	
	-- LOW_WALL_MIDDLE_BOTTOM
	{
		x=74+1*64, y=0+128+10,
		width=64, height=128,
		shape = {-32, -45, 32, -45, 32, 64, -32, 64} 
	},

	-- LOW_WALL_RIGHT_BOTTOM
	{
		x=74+2*64, y=0+128+10,
		width=64, height=128,
		shape = {-32, -45, 32, 10, 32, 64, -32, 64} 
	},

	-- MEDIUM_WALL_LEFT_TOP
	{
		x=282, y=0,
		width=64, height=146,
		shape = {-32, -73, 32, -73, 32, 55, -32, -10} 
	},
	
	-- MEDIUM_WALL_MIDDLE_TOP
	{
		x=282+1*64, y=0,
		width=64, height=146,
		shape = {-32, -73, 32, -73, 32, 55, -32, 55} 
	},

	-- MEDIUM_WALL_RIGHT_TOP
	{
		x=282+2*64, y=0,
		width=64, height=146,
		shape = {-32, -73, 32, -73, 32, -10, -32, 55} 
	},

	-- MEDIUM_WALL_LEFT_BOTTOM
	{
		x=282, y=0+146+10,
		width=64, height=146,
		shape = {-32, 10, 32, -55, 32, 73, -32, 73} 
	},
	
	-- MEDIUM_WALL_MIDDLE_BOTTOM
	{
		x=282+1*64, y=0+146+10,
		width=64, height=146,
		shape = {-32, -55, 32, -55, 32, 73, -32, 73} 
	},
	
	-- MEDIUM_WALL_RIGHT_BOTTOM
	{
		x=282+2*64, y=0+146+10,
		width=64, height=146,
		shape = {-32, -55, 32, 10, 32, 73, -32, 73} 
	},

	-- HIGH_WALL_LEFT_TOP
	{
		x=490, y=0,
		width=64, height=164,
		shape = {-32, -82, 32, -82, 32, 65, -32, -20} 
	},
	
	-- HIGH_WALL_MIDDLE_TOP
	{
		x=490+1*64, y=0,
		width=64, height=164,
		shape = {-32, -82, 32, -82, 32, 65, -32, 65} 
	},

	-- HIGH_WALL_RIGHT_TOP
	{
		x=490+2*64, y=0,
		width=64, height=164,
		shape = {-32, -82, 32, -82, 32, -20, -32, 65} 
	},

	-- HIGH_WALL_LEFT_BOTTOM
	{
		x=490, y=0+164+10,
		width=64, height=164,
		shape = {-32, 20, 32, -65, 32, 82, -32, 82} 
	},
	
	-- HIGH_WALL_MIDDLE_BOTTOM
	{
		x=490+1*64, y=0+164+10,
		width=64, height=164,
		shape = {-32, -65, 32, -65, 32, 82, -32, 82} 
	},
	
	-- HIGH_WALL_RIGHT_BOTTOM
	{
		x=490+2*64, y=0+164+10,
		width=64, height=164,
		shape = {-32, -65, 32, 20, 32, 82, -32, 82} 
	},

	-- XHIGH_WALL_LEFT_TOP
	{
		x=698, y=0,
		width=64, height=190,
		shape = {-32, -95, 32, -95, 32, 75, -32, -30} 
	},
	
	-- XHIGH_WALL_MIDDLE_TOP
	{
		x=698+1*64, y=0,
		width=64, height=190,
		shape = {-32, -95, 32, -95, 32, 75, -32, 75} 
	},

	-- XHIGH_WALL_RIGHT_TOP
	{
		x=698+2*64, y=0,
		width=64, height=190,
		shape = {-32, -95, 32, -95, 32, -30, -32, 75} 
	},

	-- XHIGH_WALL_LEFT_BOTTOM
	{
		x=698, y=0+190+10,
		width=64, height=190,
		shape = {-32, 30, 32, -75, 32, 95, -32, 95} 
	},
	
	-- XHIGH_WALL_MIDDLE_BOTTOM
	{
		x=698+1*64, y=0+190+10,
		width=64, height=190,
		shape = {-32, -75, 32, -75, 32, 95, -32, 95} 
	},
	
	-- XHIGH_WALL_RIGHT_BOTTOM
	{
		x=698+2*64, y=0+190+10,
		width=64, height=190,
		shape = {-32, -75, 32, 30, 32, 95, -32, 95} 
	}
}

return walls
