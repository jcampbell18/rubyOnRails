#!/usr/bin/env ruby

#### Mail Merge ####
#
# Launch this Ruby file from the command line
# to get started
#
# Read a template file containing the text of a letter
# Read a CSV file to get an array of people
# Set instance variables to data for each person
# Use ERB to bind instance variables to the letter template
# Save the results as separate files in a directory (e.g., "letter_01.txt")

require 'csv'
require 'erb'

APP_ROOT = File.expand_path(File.dirname(__FILE__))

csv = File.join(APP_ROOT, 'letters', 'us_presidents.csv')
letter = File.join(APP_ROOT, 'letters', 'letter_template.txt')
template = File.read(letter)

CSV.foreach(csv, headers: true) do |item|
  @first_name = item["First Name"]
  @last_name = item["Last Name"]
  @title = "The History of " + item["State"]
  @due_date = item["End"].nil? ? Time.now.year : item["End"]
  @fee = "$ #{((Time.now.year - item["End"].to_i) * 1.00)}"

  output = ERB.new(template).result(binding)

  new_file = "letter_"
  num = item["Number"].to_i < 10 ? "0#{item["Number"]}" : item["Number"]
  new_file << "#{num}.txt"
  new_filepath = File.join(APP_ROOT, 'letters', new_file)
  File.write(new_filepath, output)

  puts output
end