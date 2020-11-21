#!/usr/bin/env ruby

def divide(x,y)

  puts x/y

rescue ZeroDivisionError => e
  puts "Cannot divide by zero"
  puts "#{e.class}: #{e.message}"
rescue TypeError
  puts "Requires two integer arguments"
rescue => e
  puts "No worries"
end

begin
  divide(4,2)
  divide(4,0)
  divide(4,"2")
  divide(4)
  
# rescue ArgumentError
#   puts "Requires two integer arguments"

end
