#!/usr/bin/env ruby

#### Mail Merge ####
#
# Launch this Ruby file from the command line
# to get started
# 

require 'erb'
require 'csv'

APP_ROOT = File.expand_path(File.dirname(__FILE__))

template_path = File.join(APP_ROOT, 'letter_template.txt')
csv_path = File.join(APP_ROOT, 'us_presidents.csv')

template = File.read(template_path)

i = 0
CSV.foreach(csv_path) do |row|
  next if row[0].start_with?('Number') # Header row
  i += 1
  
  @last_name = row[1]
  @first_name = row[2]
  state = row[6]
  end_date = row[4] || Time.now.year

  @title = "The History of #{state}"
  @due_date = end_date
  years = Time.now.year - @due_date.to_i
  @fee = "$#{years * 365}.00"
  
  letter = ERB.new(template).result(binding)
  
  num = i < 10 ? "0#{i}" : i
  filename = "letter_#{num}.txt"
  filepath = File.join('letters', filename)

  puts "-------"
  puts filepath
  puts letter
  
  File.write(filepath, letter)

end
