#!/usr/bin/env ruby

require_relative 'classes/person'
require_relative 'classes/animal'

# person = Person.new
# puts person.say_hello

pig = Animal.new
pig.set_noise
puts pig.make_noise
