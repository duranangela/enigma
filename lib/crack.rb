require './lib/decrypt'

class Crack
  attr_reader :encrypted_message,
              :date,
              :key

  def initialize(encrypted_message, date)
    @encrypted_message = encrypted_message
    @date = date
    @key = '00000'
  end

  def key_output
    match = Decrypt.new(@encrypted_message, @key, @date)
    until match.output[-7..-1] == "..end.."
      @key = (@key.to_i + 1).to_s.rjust(5, '0')
      match = Decrypt.new(@encrypted_message, @key, @date)
    end
    @key
  end

end
