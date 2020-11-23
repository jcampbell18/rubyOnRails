class ShiftCipher
  @@alphabet = [*'a'..'z']

  def self.encode(str, sh=3)
    @letters = str.downcase.split('')
    @shift = sh.to_i
    encoded = []

    @letters.each do |letter|
      if @@alphabet.include?(letter)
        ix = (@@alphabet.find_index(letter)) + @shift % @@alphabet.length
        encoded << @@alphabet[ix]
      else
        encoded << letter
      end
    end

    encoded.join
  end

  def self.decode(str, sh=3)
    @letters = str.downcase.split('')
    @shift = sh.to_i
    decoded = []

    @letters.each do |letter|
      if @@alphabet.include?(letter)
        ix = (@@alphabet.find_index(letter)) - @shift % @@alphabet.length
        decoded << @@alphabet[ix]
      else
        decoded << letter
      end
    end

    decoded.join
  end
end