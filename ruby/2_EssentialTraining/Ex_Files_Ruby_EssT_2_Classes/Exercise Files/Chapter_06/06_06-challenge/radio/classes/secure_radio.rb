require_relative 'radio'
require_relative 'shift_cipher'

class SecureRadio < Radio

  @@shift = 3
  
  # Inherits Radio#play
  # Not necessary to override it
  
  protected
  
    def audio_stream
      ShiftCipher.encode(super, @@shift)
    end
  
end
