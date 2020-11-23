class DiceSet

  attr_accessor :die1, :die2
  @@max = 6

  def initialize
    puts "You created a pair of dice"
    roll
  end

  def roll
    @die1 = rand(@@max) + 1
    @die2 = rand(@@max) + 1
    display
  end

  private

    def display
      puts "[ #{@die1} ] - [ #{@die2} ]"
    end

end