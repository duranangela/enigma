require 'date'
require './lib/encrypt'
require './lib/decrypt'

class Enigma

  def initialize
  end

  def encrypt(msg, key = random_key, date = today)
    encrypted_msg = Encrypt.new(msg, key, date)
    encrypted_msg.output
  end

  def random_key
    rand(0..99999).to_s.rjust(5, '0')
  end

  def today
    Date.today.strftime('%m%e%y')
  end

  def decrypt(enc_msg, key, date = today)
    dec_msg = Decrypt.new(enc_msg, key, date)
    dec_msg.output
  end

end
