require 'date'
require './lib/encrypt_decrypt'
require './lib/cracker'
require 'pry'

class Enigma
  attr_reader :key,
              :message,
              :date,
              :decrypt_date,
              :crack_date

  def initialize
    @key          = key
    @date         = date
    @decrypt_date = decrypt_date
    @crack_date   = crack_date
  end

  def encrypt(message, key = random_key, date = today)
    @key = key
    @date = date
    @date = today if @date == Date.today
    encrypted_message = EncryptDecrypt.new(message, @key, @date)
    encrypted_message.encrypt
  end

  def random_key
    rand(0..99999).to_s.rjust(5, '0')
  end

  def today #in the correct format
    Date.today.strftime('%m%e%y')
  end

  def decrypt(encrypted_message, key, decrypt_date = today)
    @decrypt_date = decrypt_date
    @decrypt_date = today if @decrypt_date == Date.today
    decrypted_message = EncryptDecrypt.new(encrypted_message, key, @decrypt_date)
    decrypted_message.decrypt
  end

  def crack(encrypted_message, crack_date = today)
    @crack_date = crack_date
    @crack_date = today if @crack_date == Date.today
    cracked_key = Crack.new(encrypted_message, @crack_date)
    cracked_message = decrypt(encrypted_message, cracked_key.key_output, @crack_date)
    cracked_message
  end

end
