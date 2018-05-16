require './lib/rotation'
require './lib/charmap'
require 'pry'

class Encrypt
  attr_reader :in_message,
              :key,
              :date,
              :charmap

  def initialize(in_message, key, date)
    @in_message = in_message.split(//)
    @key = key
    @date = date.to_s
    @charmap = CharMap.new.charmap
  end

  def rotation
    Rotation.new(@key, @date)
  end

  def output
    out_message = []
    in_message.each_with_index do |char, index|
      rot = get_rotation(index)
      rot_num = charmap.index(char) + rot
      while rot_num >= charmap.length
        rot_num = rot_num - charmap.length
      end
      out_character = charmap[rot_num]
      out_message << out_character
    end
    out_message.join
  end

  def get_rotation(increment)
    offset = increment % 4
    return rotation.a_rotation if offset == 0
    return rotation.b_rotation if offset == 1
    return rotation.c_rotation if offset == 2
    return rotation.d_rotation if offset == 3
  end

end
