#!/usr/bin/ruby
# Transposition Cipher Encrypt/Decrypt File
# http://inventwithpython.com/hacking (BSD Licensed)

require_relative 'transpositionEncrypt.rb'
require_relative 'transpositionDecrypt.rb'

myKey = 10
myMode = 'encrypt'
inputFilename = 'frankenstein.txt'
outputFilename = 'frankenstein.encrypted.txt'

if File.exist?(inputFilename)
	fileObj = File.new(inputFilename, 'r')
else
	print 'The file ', inputFilename, ' does not exist. Quitting...',"\n"
	exit
end

if File.exist?(outputFilename)
	print 'This will overwrite the file ', outputFilename, '. (C)ontinue or (Q)uit? '
	STDOUT.flush
	response = gets
	if response.chars.first.downcase != 'c'
		exit
	end
end

content = fileObj.read

print myMode.capitalize, 'ing...', "\n"

startTime = Time.now
if myMode == 'encrypt'
	te = TranspositionEncrypt.new(content)
	translated = te.encryptMessage(myKey)
elsif
	td = TranspositionDecrypt.new(content)
	translated = td.decryptMessage(myKey)
end
totalTime = Time.now - startTime
print myMode.capitalize, "sion time: ", totalTime, "seconds","\n"

outputFileObj = File.new(outputFilename, 'w')
outputFileObj.syswrite(translated)

fileObj.close
outputFileObj.close
