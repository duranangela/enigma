require './lib/charmap'

class Crack
  attr_reader :encrypted_message,
              :date,
              :charmap

  def initialize(encrypted_message, date)
    @encrypted_message = encrypted_message.split(//)
    @date = date
    @charmap = CharMap.new.charmap
  end

end
