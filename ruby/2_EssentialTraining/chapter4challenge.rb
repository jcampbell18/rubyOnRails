#!/bin/usr/env ruby

require 'date'

days = [ "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday" ]

puts "-" * 22
puts "| Birthdate Analysis |"
puts "-" * 22
puts

month = nil
day = nil
year = nil

loop do
  puts "What year were you born?"
  print "> "
  year = gets.chomp.to_i
  break if (year < Date.today.year && year >= (Date.today.year - 120))
end

loop do
  puts "What month were you born in? "
  print "> "
  month = gets.chomp.to_i
  break if (month > 0 && month < 13)
end

loop do
  puts "What day were you born in? "
  print "> "
  day = gets.chomp.to_i
  break if (day > 0 && day < 32)
end

birthday = Date.new(year, month, day)

puts
puts "-" * 22
puts "You were born on a #{days[birthday.wday]}."
puts "It was the #{birthday.cweek} week of the year."
puts "It was the #{birthday.yday} day of the year."
puts "You were#{birthday.leap? ? '' : ' not'} born in a leap year."
puts "-" * 22

