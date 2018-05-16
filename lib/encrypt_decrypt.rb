require './lib/rotation'
require './lib/charmap'
require 'pry'

class EncryptDecrypt
  def initialize(switch, message, key = random_key, date = today)
    @message = message.split(//)
    @key = key
    @date = date
    @charmap = CharMap.new.charmap
  end

end
