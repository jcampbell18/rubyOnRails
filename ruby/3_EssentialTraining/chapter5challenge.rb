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

filepath = File.join(APP_ROOT, 'letters', 'us_presidents.csv')
data = []

CSV.foreach(filepath, headers: true) do |row|
  data << row
end

