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

- refactoring Animal class

```ruby
class Animal
    attr_accessor :noise
end

pig = Animal.new
pig.noise('Oink!')
puts pig.noise

# Oink!
```

### Method Access Control


### Initialize method




## Chapter 2: Class Attributes and Methods



## Chapter 3: Inheritance



## Chapter 4: Dates and Themes



## Chapter 5: Modules



## Chapter 6: Exceptions


