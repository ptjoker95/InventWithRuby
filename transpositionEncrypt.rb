# Transposition Cipher Encryption
# http://inventwithpython.com/hacking (BSD Licensed)

class TranspositionEncrypt
	@message = ''
	@encryptedmessage = ''

	def initialize(message)
		@message = message
	end

	def encryptMessage(key)
		ciphertext = [""] * key

		for col in (0...key)
			pointer = col
			while pointer < @message.length
				ciphertext[col] += @message[pointer]

				pointer += key
			end
		end

		#@encryptedmessage = ciphertext.join('')
		return ciphertext.join('')
	end

	def getMessage
		return @encryptedmessage
	end
end

myMessage = 'Common sense in not so common.'
myKey = 8

te = TranspositionEncrypt.new( myMessage )

ciphertext = te.encryptMessage( myKey )

puts ciphertext += '|'


