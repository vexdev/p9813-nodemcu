validationBits = function(input, shift)
	result = 0x00
	if bit.band(input, 0x80) == 0 then
		result = result + 2
	end
	if bit.band(input, 0x40) == 0 then
		result = result + 1
	end
	return bit.lshift(result, shift)
end;

p9813 = {
	new = function()
		spi.setup(1, spi.MASTER, spi.CPOL_LOW, spi.CPHA_LOW, 32, 8)

		local instance = {
			draw = function(pixel, red, green, blue)
				result = 0x00000000
				valBlue = validationBits(blue, 28)
				valGreen = validationBits(green, 26)
				valRed = validationBits(red, 24)
				blueShift = bit.lshift(blue, 16)
				greenShift = bit.lshift(green, 8)
				result = bit.bor(result, valBlue, valGreen, valRed, blueShift, greenShift, red)
				print("Drawing "..result)
				spi.send(1,0,result,0)
			end
		}
		return instance
	end;
}
--green=0x3300FF00
--red=0x3C0000FF
--blue=0x0FFF0000
--black=0x3F000000
--spi.setup(1, spi.MASTER, spi.CPOL_LOW, spi.CPHA_LOW, 32, 8)
-- Blue, Green, Red 0-65535 (32 bits each)

--local count = 0
--local mytimer = tmr.create()

--function doit(t)
--	count = count + 1
--	local colour = 0
--	if count % 3 == 0 then colour = green
--	elseif count % 3 == 1 then colour = red
--	elseif count % 3 == 2 then colour = blue
--      end
--	spi.send(1,0,colour,0)
--	t:unregister()
--	mytimer:register(500, tmr.ALARM_SINGLE, doit)
--	mytimer:start()
--end

--mytimer:register(500, tmr.ALARM_SINGLE, doit)
--mytimer:start()
