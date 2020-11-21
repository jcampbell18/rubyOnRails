#!/usr/bin/env ruby

def divide(x,y)

  puts x/y

rescue ZeroDivisionError
  puts "Cannot divide by zero"
rescue TypeError
  puts "Requires two integer arguments"
rescue
  puts "No worries"
end

begin
  divide(4,2)
  divide(4,0)
  divide(4,"2")
  divide(4)
  
rescue ArgumentError
  puts "Requires two integer arguments"

end
