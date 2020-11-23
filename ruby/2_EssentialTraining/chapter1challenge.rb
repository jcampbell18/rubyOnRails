#!/usr/bin/env ruby

require_relative 'classes/diceSet'

puts "-" * 28
puts "| Welcome to the Dice Roller |"
puts "-" * 28
puts

dice = DiceSet.new

loop do

  puts "\nMain Menu"
  puts "-------------------"
  puts "r = Roll the dice"
  puts "q = Display the dice"
  puts "==================="
  print "Enter your choice: "
  input = gets.chomp
  puts "you chose #{input}"

  if input == 'r'
    dice.roll
  elsif input == 'q'
    break
  else
    puts "#{choice} isn't a choice. Please use \'r\' or \'q\'\n"
  end
end

abort("Thanks for playing!")