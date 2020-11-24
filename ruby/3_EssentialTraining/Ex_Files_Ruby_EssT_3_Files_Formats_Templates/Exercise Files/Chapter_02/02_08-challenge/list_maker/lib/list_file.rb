module ListMaker
  class ListFile
    
    @@filename = 'lm_list.txt'
    
    def initialize
      # locate list file in APP_ROOT
      #   confirm that it is readable and writable
      # or create a new file in APP_ROOT
      #   Use File.new/open in write mode
      # if success, return self, otherwise exit program
      @filepath = File.join(APP_ROOT, @@filename)
      if File.exist?(@filepath)
        if !File.readable?(@filepath) && !File.writable?(@filepath)
          abort("File is not readable and/or writeable.")
        end
      else
        File.open(@filepath, 'w')
        unless File.exist?(@filepath)
          abort("File could not be created.")
        end
      end
      # if success, return self
      self
    end
    
    def view
      puts "\nView List\n\n".upcase
      # Read from list file
      # Use File.new/open in read mode
      # add numbers next to list items
      file = File.new(@filepath, 'r')
      file.each_line.with_index do |line, i|
        puts "#{i+1}: #{line}"
      end
      file.close
    end
    
    def add(args=[])
      puts "\nAdd a List Item\n\n".upcase
      # Add item to the end of the list.
      # Use File.new/open in append mode
      puts "Enter the new list item and hit return."
      print "> "
      new_item = gets
      File.open(@filepath, 'a') do |file|
        file << new_item
      end
    end
    
    def edit(args=[])
      puts "\nEdit a List Item\n\n".upcase
      # get the item position from the args ("edit 3", "edit 7")
      position = args.first.to_i
      # read list file and make sure that item exists
      #   Use File.readlines
      # return not found message if item does not exist
      # output text of current list item again
      # ask user to type new text
      # write list file with the new updated list
      #   Use File.write
      if position < 1
        puts "Include the number of the item to edit."
        puts "Example: edit 3"
        return
      end
      lines = File.readlines(@filepath)
      if lines[position-1].nil?
        puts "Invalid item position."
        return
      end
      puts "Enter the new text"
      puts "#{position}: #{lines[position-1]}"
      print "> "
      new_item = gets
      lines[position-1] = new_item
      data = lines.join
      File.write(@filepath, data)
      puts "List updated."
    end

  end
end
