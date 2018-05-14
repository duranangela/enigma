require 'date'
require './lib/encrypt'
require './lib/decrypt'

class Enigma
  attr_reader :key

  def initialize
    @key = key
  end

  def encrypt(message, key = random_key, date = today)
    @key = key
    if date = Date.today
      date = today
    end
    encrypted_message = Encrypt.new(message, key, date)
    encrypted_message.output
  end

  def random_key
    rand(0..99999).to_s.rjust(5, '0')
  end

  def today #in the correct format
    Date.today.strftime('%m%e%y')
  end

  def decrypt(encrypted_message, key, date = today)
    if date = Date.today
      date = today
    end
    decrypted_message = Decrypt.new(encrypted_message, key, date)
    decrypted_message.output
  end

end
