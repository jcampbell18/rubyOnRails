
class Radio
  
  attr_reader :volume

  def volume=(value)
    return if value < 1 || value > 10
    @volume = value
  end

  def crank_it_up
    @volume = 11
  end

  def status
    "Current volume: #{@volume}"
  end
  
end
