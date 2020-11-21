
class Animal

  @@species = ['pig', 'cow', 'duck', 'dog', 'horse']
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
