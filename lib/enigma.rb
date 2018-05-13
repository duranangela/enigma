require 'date'
require './lib/encrypt'
require 'pry'


class Enigma

  def initialize
  end

  def encrypt(my_message, key = random_key, date = today)
    encrypted_my_message = Encrypt.new(my_message, key, date)
    encrypted_my_message.output
  end

  def random_key
    rand(0..99999).to_s.rjust(5, '0')
  end

  def today
    Date.today.strftime('%m%e%y')
  end

end
