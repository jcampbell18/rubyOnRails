require_relative 'radio2'
require_relative 'shiftCipher'

class SecureRadio < Radio

  @@shift = 3

  protected

    def audio_stream
      ShiftCipher.encode(super, @@shift)
    end
end