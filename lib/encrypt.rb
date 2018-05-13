require './lib/rotation'
require 'pry'

class Encrypt
  attr_reader :message,
              :key,
              :date,
              :char_map

  def initialize(message, key, date)
    @message = message.split(//)
    @key = key
    @date = date.to_s
    @char_map = "abcdefghijklmnopqrstuvwxyz0123456789 .,".split(//)
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
      rot_total = char_map.index(char) + rot
      while rot_total >= char_map.length
        rot_total = rot_total - char_map.length
      end
      encrypted_character = char_map[rot_total]
      encrypted_message << encrypted_character
      rot_increment += 1
    end
    encrypted_message.join
  end

end
