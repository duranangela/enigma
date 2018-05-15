require './lib/rotation'
require './lib/charmap'
require 'pry'

class Encrypt
  attr_reader :message,
              :key,
              :date,
              :charmap

  def initialize(message, key, date)
    @message = message.split(//)
    @key = key
    @date = date.to_s
    @charmap = CharMap.new.charmap
  end

  def rotation
    Rotation.new(@key, @date)
  end

  def output
    encrypted_message = []
    rot_increment = 0
    message.each do |char|
      if rot_increment == 4
        rot_increment = 0
      end
      if rot_increment == 0
        rot = rotation.a_rotation
      elsif rot_increment == 1
        rot = rotation.b_rotation
      elsif rot_increment == 2
        rot = rotation.c_rotation
      elsif rot_increment == 3
        rot = rotation.d_rotation
      end
      rot_total = charmap.index(char) + rot
      while rot_total >= charmap.length
        rot_total = rot_total - charmap.length
      end
      encrypted_character = charmap[rot_total]
      encrypted_message << encrypted_character
      rot_increment += 1
    end
    encrypted_message.join
  end

end
