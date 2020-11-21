class ShiftCipher

  @@upcase = [*'A'..'Z']
  @@downcase = [*'a'..'z']

  def self.encode(string, pos=3)
    string.chars.map do |char|
      if @@downcase.include?(char)
        i = @@downcase.find_index(char)
        mod = i % @@downcase.length
        @@downcase[mod + pos]
      elsif @@upcase.include?(char)
        i = @@upcase.find_index(char)
        mod = i % @@upcase.length
        @@upcase[mod + pos]
      else
        char
      end
    end.join('')
  end

  def self.decode(string, pos=3)
    string.chars.map do |char|
      if @@downcase.include?(char)
        i = @@downcase.find_index(char)
        mod = i % @@downcase.length
        @@downcase[mod - pos]
      elsif @@upcase.include?(char)
        i = @@upcase.find_index(char)
        mod = i % @@upcase.length
        @@upcase[mod - pos]
      else
        char
      end
    end.join('')
  end
  
end
