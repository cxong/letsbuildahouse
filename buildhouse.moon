-- title:  Let's build a house
-- author: congusbongus
-- desc:   Arrange helpers to pass building materials and build a house
-- script: moon

x=11
y=5
SW=240
SH=136
TW=16
TH=16

class Cursor
	new:(x,y)=>
		@counter=0
		@delay=10
		@x=x
		@y=y
		@lastx=x
		@lasty=y

	move:(dx,dy)=>
		if dx==0 and dy==0
			@counter = 0
			return
		if @counter > 0
			@counter -= 1
			return

		moved = false
		@lastx = @x
		@lasty = @y
		if dy<0 and @y>0
			@y -= 1
			moved = true
		else if dy>0 and @y < SH/TH-1
			@y += 1
			moved = true
		if dx<0 and @x>0
			@x-=1
			moved = true
		else if dx>0 and @x < SW/TW-1
			@x+=1
			moved = true
		if moved
			@counter = @delay

	draw:=>
		d = @counter/@delay
		d = d*d
		x = (@x - (@x-@lastx)*d)*TW
		y = (@y - (@y-@lasty)*d)*TH
		spr(384,x,y,0,1,0,0,2,2)

cursor=Cursor(11,5)

class Map
	new:=>


	draw:=>
		-- Draw a grid
		for x=0,SW,TW
			line(x,0,x,SH,8)
		for y=0,SH,TH do
			line(0,y,SW,y,8)

map=Map()

export TIC=->

	dx = 0
	dy = 0
	if btn(0)
		dy = -1
	else if btn(1)
		dy = 1
	if btn(2)
		dx = -1
	else if btn(3)
		dx = 1
	cursor\move(dx, dy)

	cls(13)
	map\draw!
	cursor\draw!
	print("HELLO WORLD!",84,84)

-- <SPRITES>
-- 000:0000000b000000bb00000bbb0000bbbb000bbbbb00bbbbbb0bbbbbbbbbbbbbbb
-- 001:b0000000bb000000bbb00000bbbb0000bbbbb000bbbbbb00bbbbbbb0bbbbbbbb
-- 016:0000bbbb0000bbbb0000bbbb0000bbbb0000bbbb0000bbbb0000bbbb0000bbbb
-- 017:bbbb0000bbbb0000bbbb0000bbbb0000bbbb0000bbbb0000bbbb0000bbbb0000
-- 032:00000000000000000000000000000000bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb
-- 033:b0000000bb000000bbb00000bbbb0000bbbbb000bbbbbb00bbbbbbb0bbbbbbbb
-- 048:bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb00000000000000000000000000000000
-- 049:bbbbbbbbbbbbbbb0bbbbbb00bbbbb000bbbb0000bbb00000bb000000b0000000
-- 064:0000bbbb0000bbbb0000bbbb0000bbbb0000bbbb0000bbbb0000bbbb0000bbbb
-- 065:bbbb0000bbbb0000bbbb0000bbbb0000bbbb0000bbbb0000bbbb0000bbbb0000
-- 080:bbbbbbbb0bbbbbbb00bbbbbb000bbbbb0000bbbb00000bbb000000bb0000000b
-- 081:bbbbbbbbbbbbbbb0bbbbbb00bbbbb000bbbb0000bbb00000bb000000b0000000
-- 096:0000000b000000bb00000bbb0000bbbb000bbbbb00bbbbbb0bbbbbbbbbbbbbbb
-- 097:00000000000000000000000000000000bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb
-- 112:bbbbbbbb0bbbbbbb00bbbbbb000bbbbb0000bbbb00000bbb000000bb0000000b
-- 113:bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb00000000000000000000000000000000
-- 128:0077770007ffff707ff777007f7000007f7000007f7000000700000000000000
-- 129:0077770007ffff7000777ff7000007f7000007f7000007f70000007000000000
-- 144:00000000070000007f7000007f7000007f7000007ff7770007ffff7000777700
-- 145:0000000000000070000007f7000007f7000007f700777ff707ffff7000777700
-- </SPRITES>

-- <WAVES>
-- 000:00000000ffffffff00000000ffffffff
-- 001:0123456789abcdeffedcba9876543210
-- 002:0123456789abcdef0123456789abcdef
-- </WAVES>

-- <SFX>
-- 000:000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000304000000000
-- </SFX>

-- <PALETTE>
-- 000:140c1c44243430346d4e4a4e854c30346524d04648757161597dced27d2c8595a16daa2cd2aa996dc2cadad45edeeed6
-- </PALETTE>

