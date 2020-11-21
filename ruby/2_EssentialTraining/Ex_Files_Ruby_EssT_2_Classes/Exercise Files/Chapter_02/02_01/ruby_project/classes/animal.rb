
class Animal

  attr_accessor :noise, :color

  def initialize(options={})
    @noise = options[:noise] || 'Grrr!'
  end
  
end
