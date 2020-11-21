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



## Chapter 3: Inheritance



## Chapter 4: Dates and Themes



## Chapter 5: Modules



## Chapter 6: Exceptions


