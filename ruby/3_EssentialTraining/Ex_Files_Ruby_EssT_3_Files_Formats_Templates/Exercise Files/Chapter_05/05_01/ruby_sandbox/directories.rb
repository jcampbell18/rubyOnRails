Dir.entries('.').each do |entry|
  next if ['.', '..'].include?(entry)
  puts "#{entry}: " + (File.file?(entry) ? 'file' : 'dir')
end

puts "---------"

Dir.glob("*").each do |entry|
  next if entry.start_with?('.')
  next if File.directory?(entry)
  puts "file: " + entry
end
