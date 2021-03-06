| Repository Links |
| :--------------- |
| [Ruby on Rails](https://github.com/jcampbell18/rubyOnRails) |
| &#8594; [Ruby on Rails: Installation and Running Ruby on Rails 6](https://github.com/jcampbell18/rubyOnRails/tree/main/1_Installing_Setup) |
| &#8594; [Ruby on Rails: Controllers and Views](https://github.com/jcampbell18/rubyOnRails/tree/main/3_RoR_Controllers_Views) |
| &#8594; [Ruby on Rails: Models and Associations](https://github.com/jcampbell18/rubyOnRails/tree/main/4_RoR_Models_Associations) |
| [Ruby](https://github.com/jcampbell18/rubyOnRails/tree/main/ruby) |
| &#8594; [Ruby Essential Training 1](https://github.com/jcampbell18/rubyOnRails/tree/main/ruby/1_The_Basics) |
| &#8594; [Ruby Essential Training 2](https://github.com/jcampbell18/rubyOnRails/tree/main/ruby/2_EssentialTraining) |
| &#8594; [Ruby Essential Training 3](https://github.com/jcampbell18/rubyOnRails/tree/main/ruby/3_EssentialTraining) |
| [Projects](https://github.com/jcampbell18/rubyOnRails/tree/main/projects) |
| &#8594; [Demo Project](https://github.com/jcampbell18/rubyOnRails/tree/main/projects) |
| &#8594; [Simple CMS](https://github.com/jcampbell18/rubyOnRails/tree/main/projects) |

# Kevin Skoglund: Ruby Essential Training Part 2 - Classes and Modules

## Chapter 1: Classes

### Class

- class: a template of the state and behavior of objects
    - attributes = state
    - methods = behavior
- use singular nouns for names
    - Capitalize and use CamelCase

```ruby
# classes/person.rb

class Person

    def say_hello
        puts "Hello"
    end

end
```

### Instance

- instance: single object created from a class definition

```ruby
#!/usr/bin/env ruby

require_relative 'classes/person'

person1 = Person.new
person1.say_hello
```

### Attributes

- attributes: values that persist inside the instance of a class
    - properties of an object
    
- instance variable: an instance of a class ALWAYS has access to its instance variable

### Reader/Writer Methods (Getter/Setter)

```ruby
class Animal

    def noise # getter
        @hoise  # instance variable
    end 
    
    def noise=(value) # setter
        @noise = value
    end 
end

pig = Animal.new
pig.noise('Oink!')
puts pig.noise

# Oink!
```

### Attribute Methods

- attr_* methods

    - attr_reader
    - attr_writer
    - attr_accessor

```ruby
attr_reader :_name

# same as
def name
    @name
end 
```
    
```ruby
attr_writer :_name

# same as
def name=(value)
    @name = value
end 
```

```ruby
attr_accessor :_name

# same as
def name
    @name
end 
def name=(value)
    @name = value
end 
```

- refactoring Animal class with attr_*

```ruby
class Animal
    attr_accessor :noise
end

pig = Animal.new
pig.noise('Oink!')
puts pig.noise

# Oink!
```

- self
    - use self to reference the current instance from code inside the instance
    - add self when calling writer methods
    - including self is always a safe choice

```ruby
class Radio
    attr_reader :volume
    
    def volume=(value)
        return if value < 1 || value > 10
        @volume = value
    end 
    
    def crank_it_up
      self.volume = 11
    end 
    
    def volume_status
        "Current volume: #{volume}"
    end
end
```

### Method Access Control

- access control restricts access to methods from outside an instance 
    - public: anyone can access (default)
    - protected: can only be called by instances of the class and its subclasses (inheritance)
    - private: can only be called by instances of a class
    
```ruby
class Newsletter
  
# public methods
    def method1
    end 

    protected
    
        def method2
        end 
  
    private
        
        def method3
        end
end
```    

### Initialize method

- initialize method: method called automatically whenever a new instance of a class is created

```ruby
class Animal
    attr_reader :noise
  
    def initialize
      @noise = 'Oink!'
      puts "New animal instantiated"
    end 
  
end

end

pig = Animal.new
# New animal instantiated
puts pig.noise
# Oink!
```

- passing in arguments

```ruby
class Animal
    attr_accessor :noise, :color
  
    def initialize(options={}) # options is a hash
      @noise = options[:noise] || 'Grrr!'
    end 
end

pig = Animal.new({noise: 'Oink!'})
puts pig.noise
# Oink!

dog = Animal.new
puts dog.noise
# Grrr!
```

## Chapter 2: Class Attributes and Methods

### Class Methods

```ruby
class SomeClass
  def self.method_name
    # ...
  end 
end 
```

Method | Convention
------ | ----------
Class method | Array.new
Instance method | Array#size

```ruby
class Animal
  attr_accessor :noise, :color
  
  def initialize(options={})
    @noise = options[:noise] || 'Grrr!'
    @color = options[:color] || 'white'
  end 
  
  def self.types
    ['pig', 'cow', 'duck']
  end 
  
  def self.create_a_pig
    Animal.new(noise: 'Oink!', color: 'pink')
  end
end

Animal.types each do |type|
    puts type
end 
# pig
# cow
# duck

wilbur = Animal.create_a_pig
puts wilbur.noise
#Oink!
```

### Class Attributes

- properties related to a class generally, not a specific instance
- stored in the class, not on an instance
- shared values among all instances of the class
- used less frequently than class methods

```ruby
class Animal
  @@species = ['pig', 'cow', 'duck']
  @@total_animals = 0
  @@current_animals = []

  attr_accessor :noise, :color
  
  def initialize(options={})
    @noise = options[:noise] || 'Grrr!'
    @color = options[:color] || 'white'
    @@total_animals += 1
    @@current_animals << self
  end 
  
  def self.species
    @@species
  end 
  
  def self.total_animals
    @@total_animals
  end
  
  def self.create_a_pig
    Animal.new(noise: 'Oink!', color: 'pink')
  end
end

pig = Animal.new({noise: 'Oink!'})
puts pig.noise
# Oink!

Animal.species each do |type|
    puts type
end 
# pig
# cow
# duck

wilbur = Animal.create_a_pig
puts wilbur.noise
#Oink!

puts Animal.total_animals
# 2
```

### Class Reader/Writer Methods

- not like instance reader/writer (does not use attr_*)

```ruby
class Animal
  @@species = ['cat', 'cow', 'dog']
  
  def self.species  # reader
    @@species
  end 
  
  def self.species=(array)  # writer
    return unless array.is_a?(Array)
    @@species = array
  end
end 
```

```ruby
class Animal
  @@species = ['pig', 'cow', 'duck']
  @@total_animals = 0
  @@current_animals = []

  attr_accessor :noise, :color
  
  def initialize(options={})
    @noise = options[:noise] || 'Grrr!'
    @color = options[:color] || 'white'
    @@total_animals += 1
    @@current_animals << self
  end 
  
  def self.species
    @@species
  end 

  def self.species=(array)
      return unless array.is_a?(Array)
      @@species
    end

  
  def self.total_animals
    @@total_animals
  end
  
  def self.create_a_pig
    Animal.new(noise: 'Oink!', color: 'pink')
  end
end

Animal.species each do |type|
    puts type
end 
# pig
# cow
# duck

Animal.species = ['cat', 'mouse', 'moose']
Animal.species each do |type|
    puts type
end 
# cat
# mouse
# moose
```

## Chapter 3: Inheritance

### Class Inheritance

```ruby
class Animal
  attr_accessor :noise
end 

class Pig < Animal
  def initialize
    @noise = 'Oink!'
  end
end 
 
generic = Animal.new
puts generic.noise
#

wilbur = Pig.new
puts wilbur.noise
# Oink!
```

### Override and extend

```ruby
class Sofa
  @@can_open = false
  attr_accessor :width, :length

  def area
    width * length
  end 
end

class SofaBed < Sofa
  @@can_open = true 
  attr_accessor :length_opened, :is_open
  
  def area
    is_open ? width * length_opened : width * length
  end 
end
```

### Access the Superclass

- superclass = parent class
- call methods inherited from the parent
- call parent methods after overriding them 
    - perfgorm additional code before and/or after a parent method
    - fall back to a parent method if a condition is not met
- can assign return value of super to a variable
- can pass arguments to super if parent method takes arguments

```ruby
class Chef
  def make_dinner
    puts "Cook food."
  end 
end 

class AmateurChef < Chef
  def make_dinner
    puts "Read recipe."
    super
    puts "Clean up mess."
  end
end 

chef = Chef.new
chef.make_dinner
# Cook food.

amateurChef = AmateurChef.new
amateurChef.make_dinner
# Read recipe.
# Cook food.
# Clean up mess.
```

## Chapter 4: Dates and Themes

### Time

- all times are stored as the number of seconds since Jan 1, 1970
    - same as Unix time
    
```ruby
Time.now.to_i
# 1606011219

Time.at(1606011219)
# 2020-11-21 18:12:49.7813002 -0800

Time.now
# 2020-11-21 18:12:49.7813002 -0800

Time.new(year, month, day, hour, min, sec, utc_offset)

tomorrow = Time.now + (60*60*24)
next_week = Time.now + (60*60*24*7)
next_year = Time.now + (60*60*24*365)

yesterday = Time.now - (60*60*24)
last_week = Time.now - (60*60*24*7)
last_year = Time.now - (60*60*24*365)

```

### Date

- similar to Time class
    - easier to work with dates than times
- includes additional methods
- part of the Ruby Standard Library

```ruby
require 'date'

Date.today
# <Date: 2020-11-21>

Date.today.month
# 11
```

### DateTime

- subclass of Date
    - `require date`
- which to use?
    - historical: use DateTime
    - current: use Date

## Chapter 5: Modules

### Namespacing

- prevents conflicts when code has similarly named classes and methods
    - prevents conflicts with Ruby classes
- frequently used to namespace classes in open-source plugsin

```ruby
# MakeSparks: online dating website
module MakeSparks
  class Date
    #...
  end 
end 

dinner = MakeSparks::Date.new
dinner.date Date.new
```

### Mixins

- ruby only allows subclasses to inherit from one superclass
- modules allow us to package up shared functionality
    - moduels can then be mized in to a class
- when to use class inheritance or mixins
    - class inheritance: a class needs to modify or extend the behavior of another class
    - mixins: several classes need to utilize a single set of behaviors
    
```ruby
module Nameable
    attr_accessor :first_name, :last_name

    def full_name
      "#{first_name} #{last_name}"
    end
end 

module ContactInfo
  attr_accessor :city, :state, :zip
  
  def city_state_zip
    "#{city}, #{state} #{zip}"
  end
end

class Person
  include Nameable
  include ContactInfo
end 

class Customer
    include Nameable
    include ContactInfo
end 
```

### Load, require, include

- `load`
    - loads a source file every time it is called
    - returns true if a file is loaded successfully
- `require`
    - use full path
    - loads a source file only once
    - returns true if a file is loaded successfully and has not been loaded before
- `require_relative`
    - same as require but use the relative path
- `include`
    - includes modules in classes
    - NOTHING to do with loading files

## Chapter 6: Exceptions

### Handle Exceptions

- Classes for handling exceptional errors
    - [Exception class in Ruby Docs](https://ruby-doc.org/core-2.7.2/Exception.html)
    - most common error is StandardError
        - e.g., `1/0` results in ZeroDivisionError
        
- handling inside the method
        
```ruby
def divide(x,y)
    puts x/y
rescue
    puts "Cannot divide by zero"
end 

divide(4,2)
# 2
divide(4,0)
# Cannot divide by zero
```

- bubble up (handling outside the method)

```ruby
def divide(x,y)
    puts x/y
end 

begin
  divide(4,2)
  divide(4,0)
rescue
    puts "Cannot divide by zero"
end
```

### Handle specific Exceptions

- StandardError is default for rescue
- example below is specific StandardErrors, or defaults to StandardError
- NEVER rescue the entire Exception class `rescue Exception`
    - it's too broad

```ruby
def divide(x,y)
    puts x/y
rescue ZeroDivisionError
    puts "Cannot divide by zero"
rescue TypeError
    puts "Requires two integer arguments"
rescue
    puts "No worries"
end 

divide(4,2)
# 2
divide(4,0)
# Cannot divide by zero
divide(4, "2")
# Requires two integer arguments 
```

### Exception Methods

- Exception#class is useful to know which class is erroring
    - `ZeroDivisionError`
- Exception#message the message that tells you what was wrong
    - `(divided by 0)`
- Exception#backtrace returns the array of strings that tells you what is wrong
    - `Traceback (most recent call last): ...`
- Exception#full_message returns the typical message when something goes wrong
    - everything above combined

```ruby
begin
    1/0
rescue ZeroDivisionError => e
    puts "Cannot divide by zero"
    puts "#{e.class}: #{e.message}"
rescue => e
    puts "#{e.class} handled"
end 
```

### Raise Exceptions

- code can raise exceptions too
    - can use Ruby's built-in exception classes
    - can define custom exceptions
- RunTimeError is default for `raise`

```ruby
def even_numbers(array)
    unless array.is_a?(Array)
      raise ArgumentError
    end 

    if array.length == 0
      raise StandardError.new("Too few elements")
    end 

    array.find_all { |el| el.to_i % 2 == 0 }
end

puts even_numbers([1, 2, 3, 4, 5]).join(',')
# 2, 4
puts even_numbers(1..20).join(',')
# ArgumentError (ArgumentError)
puts even_numbers([]).join(',')
# Too few elements (StandardError)
```

### Custom Exceptions

- best practice is inheriting from StandardError

```ruby
class TooLoudError < StandardError
  attr_reader :volume

  def initialize(value, msg=nil)
    # Let parent class set message 
    super(msg || "Too loud!" )
    @volume = value
  end
end 

class Radio
  def volumne=(value)
    if value > 10
      raise TooLoudError.new(value)
    end 
    @volume = value
  end 
end 

begin
  r = Radio.new
  r.volume = 20
rescue TooLoudError => e
  puts "Volume #{e.volume}: #{e.message}"
end 
```