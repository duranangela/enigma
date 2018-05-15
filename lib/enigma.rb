require 'date'
require './lib/encrypt'
require './lib/decrypt'
require './lib/crack'

class Enigma
  attr_reader :key,
              :message,
              :date,
              :decrypt_date

  def initialize
    @key = key
    @message = message
    @date = date
    @decrypt_date = decrypt_date
  end

  def encrypt(message, key = random_key, date = today)
    @key = key
    @message = message
    @date = date
    if date = Date.today
      date = today
    end
    encrypted_message = Encrypt.new(@message, @key, @date)
    encrypted_message.output
  end

  def random_key
    rand(0..99999).to_s.rjust(5, '0')
  end

  def today #in the correct format
    Date.today.strftime('%m%e%y')
  end

  def decrypt(encrypted_message, key, decrypt_date = today)
    @decrypt_date = decrypt_date
    if decrypt_date = Date.today
      decrypt_date = today
    end
    decrypted_message = Decrypt.new(encrypted_message, key, @decrypt_date)
    decrypted_message.output
  end

  def crack(encrypted_message, date = today)
    if decrypt_date = Date.today
      decrypt_date = today
    end
    cracked_key = Crack.new(encrypted_message, date)
    cracked_message = decrypt(encrypted_message, cracked_key.key_output, date)
    cracked_message
  end

end
