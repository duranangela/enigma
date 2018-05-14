require './lib/rotation'
require 'pry'

class Decrypt
  attr_reader :encrypted_message,
              :key,
              :date,
              :char_map

  def initialize(encrypted_message, key, date)
    @encrypted_message = encrypted_message.split(//)
    @key = key
    @date = date
    @char_map = Char_map.new.char_map
  end

  def rotation
    Rotation.new(@key, @date)
  end

  def output
    decrypted_message = []
    rot_increment = 0
    encrypted_message.each do |char|
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
      rot_num = char_map.index(char) - rot
      while rot_num < 0
        rot_num = rot_num + char_map.length
      end
      decrypted_character = char_map[rot_num]
      decrypted_message << decrypted_character
      rot_increment += 1
    end
    decrypted_message.join
  end

end
