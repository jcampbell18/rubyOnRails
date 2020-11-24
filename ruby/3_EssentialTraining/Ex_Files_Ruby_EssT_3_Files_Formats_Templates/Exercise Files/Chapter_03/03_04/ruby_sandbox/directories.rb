Dir.entries('.').each do |entry|
  next if ['.', '..'].include?(entry)
  puts "#{entry}: " + (File.file?(entry) ? 'file' : 'dir')
end

