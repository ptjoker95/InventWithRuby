# Caesar Cipher Hacker
# http://inventwithpython.com/hacking (BSD Licensed)

message = 'GUVF VF ZL FRPERG ZRFFNTR.'
LETTERS = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'

for key in (0...LETTERS.length)
	translated = ""

	message.each_char do |symbol|
		if num = LETTERS.index(symbol)
			num -= key
			if num < 0
				num += LETTERS.length
			end
			translated << LETTERS[num]

		else
			translated << symbol
		end
	end

	print "Key #", key, ": ", translated, "\n"
end
