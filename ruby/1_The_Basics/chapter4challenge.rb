#!/usr/bin/env ruby

puts " * Guessing Game *"
print "Player\'s name: "
playerName = gets.chomp

puts "Hello, #{playerName}."
puts "We are going to play a guessing game."

print "What should be the highest number? "
highestNumber = gets.chomp.to_i
while highestNumber < 2 && highestNumber > 100
  print "What should be the highest number? "
  highestNumber = gets.chomp.to_i
  if (highestNumber < 2 || highestNumber > 100)
    puts "Number needs to be higher than 1, and less than 101"
  end
end

print "How many guesses do you need? "
numberOfGuesses = gets.chomp.to_i
while (numberOfGuesses < 1 && numberOfGuesses > highestNumber)
  print "How many guesses do you need? "
  numberOfGuesses = gets.chomp.to_i
  if (numberOfGuesses < 1 && numberOfGuesses > highestNumber)
    puts "Guesses needs to be higher than 0, and less than #{highestNumber}"
  end
end

puts "I will choose a random number between 1 and #{highestNumber}"
puts "and you will have 3 chances to guess it."

randomNumber = rand(highestNumber) + 1
puts "Okay, I have my number."

i = 1
while i < numberOfGuesses
  print "Guess #{i}: "
  guess = gets.chomp
  if guess.to_i == randomNumber
    puts "Great guessing, #{playerName}!"
    puts "My number was #{randomNumber}."
    abort("\nGoodbye!")
  else
    puts "Sorry, that wasn\'t' it."
    i += 1
  end
end

puts "That was your last guess."
puts "My number was #{randomNumber}\n"
abort("Goodbye!")



