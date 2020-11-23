#!/bin/usr/env ruby

require_relative 'classes/to_do_list'

puts "-" *14
puts "| To Do List |"
puts "-" *14
puts

list = ToDoList.new(['dishes', 'nap', 'laundry', 'vacuum'])

puts "First: " + list.first
puts
puts "Longest: " + list.find { |item| item.length > 6 }
puts
puts "Original List: "
puts list.map { |item| "> #{item.capitalize}" }

list << "sweep"
puts
puts "Updated list:"
puts list.map { |item| "> #{item.capitalize}" }
puts
puts "Sorted:"
list.sort.each_with_index do |item, i|
  puts "#{i+1}: #{item}"
end
puts
