# Ruby

## 1: The Basics

### Chapter 2: Object Types

#### Variable Scope Indicators

- Global
    - `$variable`
- Class
    - `@@variable`
- Instance
    - `@variable`
- Local
    - `variable`
- Block
    - `variable`

#### Numbers

- integers
- floats

#### Strings

- append
    - `greeting = "Hello"`
    - `greeting << ' '`
    - `greeting << "World!`
    - `puts greeting`
        - Hello World!
- methods
    - .reverse
    - .capitalize
    - .upcase
   
#### Arrays

```
my_array = [1, "c", ["a", 2], "d"]
```

- ordered collection

- create/append
    - empty array
        - `my_array = []`
    - put values in array
        - `my_array[0] = "B"`
            - my_array => ["B"]
        - `my_array << "B"`
            - my_array => ["B", "A"]
        - `my_array[3] = "C"`
            - my_array => ["B", "A", "C"]
        
- symbols
    - ! => permanent
    - ? => queries
    
- methods

method | description | code | output
------ | ----------- | ---- | ------
.reverse | temporarily reverses | `my_array.reverse` | ["C", "A", "B"]
.reverse! | permanently reverses | `my_array.reverse!` | ["C", "A", "B"]
.shuffle | shuffles array | `my_array.shuffle | ["A", "C", "B"]
.uniq | does not allow duplicate | `(["c","a","a",t"]).delete_at(1)` | ["c", "t"] | | 
.compaq | removes nil | `(["c",nil,"t"]).compaq` | ["c", "t"]
.flatten | takes any subarray and inserts into parent array | `(["c",["a","t"]]).flatten` | ["c","a","t"] |
.include?() | checks array for value | `my_array.include?("A")` | true
.delete_at() | deletes at index | `(["c","a","t"]).delete_at(1)` | ["c", "t"]
.delete() | deletes the value from the array | `(["c","a","t"]).delete("A") | ["c", "t"]
.join or .join() | joins the array into a string | `(["hello", "world"]).join(' ')` | "hello world"
.split() | puts into array by a delimeter | `('h i t').split(' ')` | ["h", "i", "t"] 
.push | adds to list | | |
.pop | removes from list | | |
.shift | remove item from front of list | | |
.unshift | adds item to front of list | | |
   - `+`
        - combines arrays together
            - [1,2,3] + [4,5,6] = [1,2,3,4,5,6]
    - `+`
        - removes arrays
            - [1,2,3] + [2] = [1,3]
            
#### hashes

- unordered, object-indexed collection of objects 
    - (unique key, value)
    
```
    car = {
        'brand' => 'Ford',
        'model' => 'Mustang',
        'color' => 'blue'
    }
```

#### symbols

```
:first_name
```

- like strings, but cannot be edited
- not delimited by quotes
- rules: lowercase, underscore
- used for labeling a piece of data
- same item in memory unlike strings

```
person = {
    :first_name => 'Benjamin',
    :last_name => 'Franklin'
}

person[:last_name]
```

- hash symbol shorthand (looks like json)
    - long-hand
        - `person = { :first_name => 'Benjamin', :last_name => 'Franklin' }`
    - short-hand
        - `person = { first_name: 'Benjamin', last_name: 'Franklin' }`

#### booleans

desc |  code
-------|----
equal | `==`
less than | `<`
greater than | `>`
less than or equal to | `<=`
greater than or equal to | `>=`
not | `!`
not equal | `!=`
and | `&&`
or | `||`
    
#### ranges

- inclusive range
    - 1..5 => 1, 2, 3, 4, 5
- exclusive range
    - 1...5 => 1, 2, 3, 4
    
- trick for an array
```
inclusive = 1..5
my_array = [*inclusive]
// makes array out of the inclusive array
// my_array => [1, 2, 3, 4, 5]

alpha = 'a'..'d'
my_array2 = [*alpha]
// my_array2 => [ 'a', 'b', 'c', 'd' ]
```

- methods
    - .begin
    - .first
    - .end
    - .last
    

#### constants

`Max_score = 100`

- quircks
    - the constant can be reassigned (gives warning though)
    - instead of all caps, first letter is capitalized

#### nil

- nil is part of NilClass
- `something.nil?` is same as `something == nil`

### Chapter 3: Control Structures

#### conditionals

```
if boolean
    ...
elsif boolean
    ...
else
    ...
end
```

#### loops

```
loop do
    break if boolean
    ...
end

while boolean
    ...
end

until boolean
    ...
end
```

#### iterators

iterators | code
--------- | -------
.times | `5.times { puts "Hi"}`
.upto() | `1.upto(5) { puts "Hi"}`
.downto() | `5.downto(1) { puts "Hi"}`
(range).each | `(1..5).each { puts "Hi"}`

- block variable
```
5.downto(1) do |i|
    puts "Hi #{i}
end
```

- iterators by class
    - numbers: times, upto, downto, step
    - range: each, step
    - string: each_line, each_char, each_byte
    - array: each, each_index, each_with_index
    - hash: each, each_key, each_value, each_pair
    
```
fruits = ["banana", "apple", "pear"]

fruits.each do |fruit|
    puts fruit.capitalize
end

for fruit in fruits
    puts fruit.capitalize
end
```

### Chapter 4: Scripting

- Best Practices
    1. put a shebang line at the top
        - `#!/usr/bin/env ruby`
    2. exit a running script
        - `exit` or `exit!`
        - `abort(msg)`
- Input and Output
    - puts or print
    - gets (takes the return key also)
        - chop (removes the last character of a string)
        - chomp (removes last character if it is a new line character)
        
```
print "What is your name? "
response = gets.chomp
puts "Hello #{response}!"
```
    
### Chapter 5: Enumerables and Code Blocks

- Enumberables: a set of items that can be counted (arrays, ranges, hashes)

- Code Blocks: curly brace format, do-end format

```
# curly brace
5.downto(1) { |i|... }

# do end
5.downto(1) do |i|
    ...
end
```

- Find Methods

method(s) | code | returns
--------- | ---- | -------
`.find` or `.detect` | `(1..10).find { |n|  n == 5 }` | 5
`.find_all` or `.select` | `(1..10).find_all { |n| n % 2 == 0}` | [2,4,6,8,10]
`.any?` or `.none?` | `(1..10).select { |n| n % 2 == 0}` | true
`.all?` or `.one?` | `(1..10).select { |n| n % 2 == 0}` | false
.delete_if | `([1,2,3,4,5]).delete_if {|n| n % 2 == 0}` | [1,3,5]

- Map/Collect Methods
    - iterates through an enumerable
    - executes a code block on each item
    - add the result of the block to a new array

```
x = [ 1, 2, 3, 4 ]

y = x.map { |n| n + 1}

# y = [ 2, 3, 4, 5 ]
```

```
scores = { low: 2, high: 8, avg: 6 }

adj_scores = scores.map do |k, v|
    "#{k.capitalize}: #{v * 100}"
end

# adj_scores = [ "Low: 200", "High: 800", "Avg: 600" ]
```

- Inject/Reduce Methods
    - block variable to use for accumulation
    
```
(1..5).reduce { |memo, n| memo + n }

# memo = 1
# memo = memo + 2 = 3
# memo = memo + 3 = 6
# memo = memo + 4 = 10
# memo = memo + 5 = 15

# 15
```
    
- Sort Methods
    - uses the comparison operator `<=>`
    - returns -1, 0 or 1
    
```
fruit = [ "banana", "pear", "apple" ]

x = fruit.sort do |fruit1, fruit2|
    fruit1.length <=> fruit2.length
end

# [ "pear", "apple", "banana" ]
```


- Merge Methods
    - used for hashes only
    - merges two hashes together
    - block can provide rules to use when merging
    
```
h1 = { :a => 2, :b => 4, :c => 6 }
h2 = { :a => 3, :b => 4, :d => 8 }

h1.merge(h2)

# { :a => 3, :b => 4, :c => 6, :d => 8 }
```

## additional links

[Kevin Skoglund: Ruby Essential Training Part 1: The Basics](https://www.linkedin.com/learning/ruby-essential-training-part-1-the-basics?u=41913900)

[Kevin Skoglund: Ruby Essential Training Part 2: Classes and Modules](https://www.linkedin.com/learning/ruby-essential-training-part-2-classes-and-modules?u=41913900)

[Kevin Skoglund: Ruby Essential Training Part 3: Files, Formats, Templates](https://www.linkedin.com/learning/ruby-essential-training-part-3-files-formats-templates?u=41913900)

[Ruby Documentation](https://ruby-doc.org)

[rubygems.org](https://rubygems.org/)