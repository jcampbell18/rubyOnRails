# Two ways to open files for reading/writing

# 1. Instantiate a file object, give it instructions, close it
file = File.new('groceries.txt', 'w')
# ... work with the file
file.puts "Grocery List"
file.print "+ butter\n"
file.write "+ milk\n"
file << "+ sugar\n"
file.close

# 2. Provide a file with a block of instructions
File.open('groceries.txt', 'r') do |file|

  # ... work with the file

end

# second argument is the 'mode': r, w, a, r+, w+, a+
