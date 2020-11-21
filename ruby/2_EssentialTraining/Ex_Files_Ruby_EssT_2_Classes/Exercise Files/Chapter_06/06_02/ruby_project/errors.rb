#!/usr/bin/env ruby

def divide(x,y)

  puts x/y

# rescue
# 
#   puts "Cannot divide by zero"
  
end

begin
  divide(4,2)
  divide(4,0)
rescue

  puts "Cannot divide by zero"

end
