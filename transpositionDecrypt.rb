# Transposition Cipher Decryption
# http://inventwithpython.com/hacking (BSD Licensed))

class TranspositionDecrypt
	@message = ''

	def initialize(message)
		@message = message	
	end

	def decryptMessage(key)
		numOfColumns = (@message.length/key.to_f).ceil

		numOfRows = key

		numOfShadedBoxes = (numOfColumns * numOfRows)-@message.length

		plaintext = [""] * numOfColumns

		col = 0
		row = 0

		@message.each_char do |symbol|
			plaintext[col] += symbol
			col += 1

			if( col==numOfColumns ) || (col == numOfColumns-1 && row >= numOfRows-numOfShadedBoxes)
				col = 0
				row += 1
			end
		end

		return plaintext.join('')
	end
end

myMessage = 'Cenoonommstmme oo snnio. s s c'
myKey = 8

dm = TranspositionDecrypt.new(myMessage)
plaintext = dm.decryptMessage(myKey)

puts plaintext
