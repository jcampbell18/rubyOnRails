link |
---- |
[back](../) |
[next](#) |

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



### Mixins



### Load, require, include



## Chapter 6: Exceptions


