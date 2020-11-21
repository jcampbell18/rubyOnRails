#!/usr/bin/env ruby

require_relative 'classes/person'
require_relative 'classes/animal'

person = Person.new
person.first_name = "Bob"
person.last_name = "Smith"
puts person.full_name
puts person.initial_and_last_name
#puts person.get_initial("Lucy")

puts "-----"

pig = Animal.new({noise: 'Oink!'})
puts pig.noise