#!/usr/bin/ruby
# Transposition Cipher Test
# http://inventwithpython.com/hacking (BSD Licensed))

require_relative 'transpositionEncrypt.rb'
require_relative 'transpositionDecrypt.rb'

if __FILE__ == $0
	randomnumber = Random.new(42)

	for i in (0...20)
		message = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ' * randomnumber.rand(4..40)

		message = message.split('')
		message.shuffle!
		message = message.join('')

		print "Test #", i+1, ": ", message[0..50], "\n"

		for key in (1..message.length)
			te = TranspositionEncrypt.new(message)
			encrypted = te.encryptMessage(key)
			td = TranspositionDecrypt.new(encrypted)
			decrypted = td.decryptMessage(key)

			if message != decrypted
				puts "Mismatch with key ", key, " and message ", message, "."
				puts decrypted
			end
		end
	end
end
