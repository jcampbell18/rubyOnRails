link |
---- |
[back](https://github.com/jcampbell18/rubyOnRails/tree/main/ruby/2_EssentialTraining) |
[ruby](https://github.com/jcampbell18/rubyOnRails/tree/main/ruby) |
[RoR](https://github.com/jcampbell18/rubyOnRails) |


# Kevin Skoglund: Ruby Essential Training Part 3 - Files, Formats, Templates

## Chapter 1: The File System

### Input/Output Basics

- [IO Class](https://ruby-doc.org/core-2.7.2/IO.html)
- input
    - `gets`
    - reading data from file
- output
    - `print` or `puts`
    - writing data to file

### File System Basics

- File path separators
    - unix, linux, mac path separator: `/`
    - Windows path separator: `\`
    - File class has method called join so you don't need to determine OS

```ruby
File.join('shared', 'lib', 'myfile.rb')
# shared/lib/myfile.rb
```

### Types of File Paths

- `__FILE__`
    - the file constant, the constant ruby defines to launch the script
        - example: `File.expand_path(__FILE__)`
        - gettings absolute path
            - get directory name: `File.dirname(__FILE__)`
            - absolute path: `File.expand_path(File.dirname(__FILE__))`
                - same as `__dir__`

### File Permissions

- `chown` is change owner
- `chmod` is change permissions
- rwx is Read Write Execute
    - Owner Group Other
        - file permissions: rwxrwxrwx

## Chapter 2: Work With Files

### Access Files

- file access modes

access | description | when to use
------ | ----------- | -----------
r | read from the start (must exist) | read-only access to file
r+ | allow to write too | reading/writing to an existing file
w | truncate/write from start | starting a new file, if exists rewrites
w+ | allow to read too | ...
a | append/write from end | appending data to the end of a file
a+ | allow to read too | ...

```ruby
file = File.new(filepath, 'w')
#... work with the file
file.close
```

```ruby
File.open(filepath, 'r') do |file|
#... work with the file
end #auto-close file
```

### Write To Files

- in order to write, first step is to access the file
    - `file = File.new('groceries.text', 'w')`
- then you can use methods to write
    - `file.puts "Grocery List"`
    - `file.print "+ butter\n"`
    - write also works exactly like `puts`
        - `file.write "+ milk\n"`
    - you can use the append operator `<<` also, it always puts pointer to the end
        - `file << "+ sugar\n"`
- close the file when finished
    - `file.close`

### Read From Files

- in order to read, first step is to access the file
    - `file = File.new('groceries.text', 'r')`
- then you can use methods to read
    - the read method has a parameter for how many characters to read
        - `string1 = file.read(4)`
        - the cursor waits after 4 characters
    - can use `gets`
        - `line1 = file.gets.chomp`
- have to end reading AT EOF (End of file) or will have problems
    - using a loop
    
```ruby
File.open('groceries.txt', 'r') do |file|
    file.each_line do |line|
      puts line.chomp.reverse
    end 
end
```
    
- close the file when finished
    - `file.close`

### File Pointer

- file pointer: similar to the cursor in a word-processing application
    - moves forward/backward
    - choose a position to start reading or writing
    - unlike cursor, file pointer will overwrite text where it's position is
- get current pointer position
    - `.pos` returns an int
- reset to 0
    - `.rewind`

### Read or Write an Entire File

- Read Entire File
    - File.read(filepath)
        - File access mode is omitted (assumes read)
        - File instance does not need to be closed
        - only use with small data files
        - holds all file data in memory
    - File.readlines(filepath)
        - same as File.read, but returns array
        - does NOT remove ending line returns
- Write Entire File
    - File.write(filepath, string)
        -   File access mode is omitted (assumes write)
        - truncates/overwrite any existing file by default
        - provide optional argument for position to avoid truncating

### Rename, Delete, Copy'

- File.rename('oldname.txt', 'newname.txt')
- File.delete('file.txt')
- copy
    - `require 'fileutils`
    - FileUtils.copy('orig.txt', 'duplicate.txt')
    - fileutils also has:
        - copy, cp
        - move, mv
        - remove, rm
        - cd, pwd
        - chown, chmod, touch, ln

### Examine File Details

- File.exist?(filepath)
- File.file?(filepath)
- File.directory?(filepath)
- File.readable?(filepath)
- File.writable?(filepath)
- File.executable?(filepath)
- File.size(filepath) => returns in bytes
- File.dirname(filepath) => directory of file
- File.basename(filepath)
- File.extname(filepath)

- File.mtime(filepath)
    - last modified time (last write)
- File.atime(filepath)
    - last acessed time (last read or write)
- File.ctime(filepath)
    - last status change time (last read or write or permissions changed)
    - NOT created time

## Chapter 3: Work With Directories

### Create Directories

- Create
    - Dir.mkdir(filepath)
    - `require 'fileutils'`
        - FileUtils.mkdir(filepath)
- Delete
    - Dir.delete(filepath)
        - does not delete unless empty
    - Dir.empty?(filepath)
        - find out if empty
    - `require 'fileutils`
        - FileUtils.rmdir(filepath)
            - does not delete unless empty
        - FileUtils.rm_r(filepath)
            - deletes directory and all contents recursively

```ruby
current_dir = File.dirname(__FILE__)
# current_dir = '.'
new_dir = File.join(current_dir, 'new')
# new_dir = './new'
Dir.mkdir(new_dir)
# 0
Dir.empty?(new_dir)
# true
Dir.delete(new_dir)
# 0
```

### Change Directories

- `relative_path = File.dirname(__FILE__)`
- `absolute_path = File.expand_path(relative_path)`
- `chdir` is change directory

```ruby
Dir.pwd
# "Users/kevinskoglund/Desktop/ruby_sandbox"
path = File.join('', 'Users', 'kevinskoglund', 'Desktop')
# "Users/kevinskoglund/Desktop"
Dir.chdir(path)
# 0
Dir.pwd
# "Users/kevinskoglund/Desktop"
Dir.chdir('ruby_sandbox')
# 0
Dir.pwd
# "Users/kevinskoglund/Desktop/ruby_sandbox"
```

### Entries

- entries: working with contents of directories
- `array = Dir.entries(filepath)` => includes entries for "." and ".."
    - returns array of entries
    
```ruby
Dir.entries('.').each do |entry|
    next if ['.', '..'].include?(entry)
    puts "#{entry}: " + (File.file?(entry)) ? 'file' : 'dir'
end 
```

### Glob

- glob: returns an array of filenames which match a pattern
    - patterns are similar to globs in unix shell
    - primitive regular expression
    - `array = Dir.glob("*")` => does not include entries for "." and ".."
    
```ruby
Dir.glob("*").each do |entry|
    next if entry.start_with?('.')
    next if File.directory?(entry)
    puts "file: " + entry
end 
```

#### Glob Pattern Symbols

symbol | description
------ | -----------
* | Matches all files (wildcard)
c* | Matches files beginning with c
*c | Matches files ending with c
*c* | Matches all files with c in them
** | Matches directories recursively
? | Matches any one character
[a-z] | Matches any one character in the set
{p,q} | Matches either literal p or literal q

## Chapter 4: Common Data Formats

### CSV

- comma-separated values

```ruby
require 'csv'

# read from file
CSV.foreach("file.csv") do |row|
    # ...
end 

array_of_arrays = CSV.read("file.csv")

# write to file
CSV.open('file.csv', 'w') do |csv|
    csv << ["row", "of", "CSV", "data"]
end 
```

```ruby
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

early_presidents = presidents[0..9] # the first 10 presidents

CSV.open('early_presidents.csv', 'w') do |csv|
    csv << header
    early_presidents.each do |row|
      csv << row
    end
end 
```

### CSV to Hashes

- header row contains labels (not repeated)
- hash uses labels as keys for each value (repeated)
- `.zip` take array and another array and merge (e.g., header and data)
- `to_h` turns to hash

```ruby
labels = header.map { |item| item.downcase.gsub(/\s/, '_') } # headers are all lowercase and spaces are replaced with underscores
new_array = presidents.map do |row|
    labels.zip(row).to_h
end 

# {
#    "number" => "1",
#    "last_name" => "Washington"
#    "first_name" => "George",
#    ...
```

### YAML

- YAML: YAML Ain't Markup Language
    - YAML is a human-friendly data serialization standard for all programming languages
    - often used for configuration files
    - Psych uses a more modern library of YAML
    - [YAML](http://yaml.org)

- Read YAML

```ruby
require 'psych'

yaml = File.read("file.yml")
ruby_data = Psych.load(yaml)
```

- Write YAML

```ruby
require 'psych'

yaml = Psych.dump(ruby_data)
yaml = {'enabled' => true}.to_yaml

File.write("file.yml", yaml)
```

### JSON

- JSON: JavaScript Object Notation
    - [JSON](http://json.org)
    
- Read a File
    
```ruby
require 'json'

json = File.read("file.json")
hash = JSON.parse(json)
```

- Write to File

```ruby
require 'json'

jason = JSON.generate(hash)
json = {'enabled' => true}.to_json
json = File.write("file.json", json)
```

### XML

- XML: Extensible Markup Language
    - Designed to make documents human and machine readable
    - Built-in Ruby XML Library: REXML
        - outdated!
    - Ruby Gems (modern libraries)
        - [nokogiri](https://nokogiri.org) => most popular and powerful
        - nori
        - gyoku
        - multi_xml
        - xml-simple => very simple

## Chapter 5: ERB Templating

### Embed Ruby

- ERB: Embedded Ruby
    - eRuby templating system to embed Ruby
    - in standard library
- `<% code %>` => evaluates the code and does NOT output
- `<%= code %>` => evaluates the code and outputs

```ruby
require 'erb'

template = "The year is <%= Time.now.year %>."
puts template
# "The year is <%= Time.now.year %>."

renderer = ERB.new(template)
puts renderer.result
# "The year is 2020."
```

- example of using both ways

```ruby
require 'erb'

template = ""
template << "<% result = 2 + 2 %>"
template << "2 + 2 = <%= result %>"

renderer = ERB.new(template)
puts renderer.result
# "2 + 2 = 4"
```

### Binding

- binding: every ruby object stores its instance variable in a Binding object
    - accessible using private instance method called #binding
    - passing a binding as an argument to ERB#result gives a template acecss to all instance variables stored in the binding
        - only works with instance variables, not local or class
            - @variable
         
 ```ruby
require 'erb'

@year = Time.now.year
template = "The year is <%= @year %>."
renderer = ERB.new(template)
puts renderer.result(binding)
# "The year is 2020."
```   

### Template Files

```ruby
require 'erb'

@year = Time.now.year

template = File.read(filepath)

puts ERB.new(template).result(binding)
```

- example:

```text
# inquiry.txt.erb
Product inquiry from:

First Name: <%= @customer.first_name %>
Last Name: <%= @customer.last_name %>
Email: <%= @customer.email %>
```

```ruby
# erb_inquiry.rb
require 'erb'

class Customer
    attr_accessor :first_name, :last_name, :email
end 

@customer = Customer.new
@customer.first_name = "Jason"
@customer.last_name = "Campbell"
@customer.email = "jasonlcampbell18@gmail.com"

filename = 'inquiry.txt.erb'
template = File.read(filename)
output = ERB.new(template).result(binding)
puts output

# Product inquiry from:
#
# First Name: Jason
# Last Name: Campbell
# Email: jasonlcampbell18@gmail.com
```