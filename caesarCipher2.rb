# Caesar Cipher
# http://inventwithpython.com/hacking (BSD Licensed)

message =  'This is my secret message.'

key = 13

mode = 'encrypt'

LETTERS = ' !"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\] ^_`a bcdefghijklmnopqrstuvwxyz{|}~'

translated = ''

message = message.upcase

message.each_char do |symbol|
	if num = LETTERS.index(symbol)
		if mode == 'encrypt'
			num += key
		elsif mode == 'decrypt'	
			num -= key
		end
		
		if num >= LETTERS.length
			num = num - LETTERS.length
		elsif num < 0
			num = num + LETTERS.length
		end

		translated += LETTERS[num]

	else
		translated += symbol
	end
end

	print translated + "\n"
