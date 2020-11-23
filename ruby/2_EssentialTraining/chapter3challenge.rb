#1/usr/bin/env ruby

require_relative 'classes/secureRadio'
require_relative 'classes/shiftCipher'

radio = Radio.new
puts radio.status
3.times do
  radio.play
end

puts '-' * 10

sradio = SecureRadio.new
puts sradio.status
3.times do
  sradio.play
end

# puts '-' * 10
# puts "phrase:\t\tI Heard It Through the Grapevine"
# enc = ShiftCipher.encode("I Heard It Through the Grapevine")
# puts "encoded:\t#{enc}"
# dec = ShiftCipher.decode(enc)
# puts "decoded:\t#{dec}"


