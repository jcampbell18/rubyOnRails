require 'csv'

header = nil
presidents = []

CSV.foreach('us_presidents.csv') do |row|
  if header.nil?
    header = row
  else
    presidents << row
  end  
end

early_presidents = presidents[0..9]

CSV.open('early_presidents.csv', 'w') do |csv|
  csv << header
  early_presidents.each do |row|
    csv << row
  end
  
end
