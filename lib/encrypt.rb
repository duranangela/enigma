require 'pry'

class Encrypt
  attr_reader :msg,
              :key,
              :date,
              :char_map

  def initialize(msg, key, date)
    @msg = msg.split(//)
    @key = key.rjust(5, '0')
    @date = date.to_s
    @char_map = "abcdefghijklmnopqrstuvwxyz0123456789 .,".split(//)

  end

  def a_rotation
    key[0..1].to_i + offset[0].to_i
  end

  def b_rotation
    key[1..2].to_i + offset[1].to_i
  end

  def c_rotation
    key[2..3].to_i + offset[2].to_i
  end

  def d_rotation
    key[3..4].to_i + offset[3].to_i
  end

  def offset
    date_code = (@date.to_i ** 2).to_s
    date_code[-4..-1]
  end

  def output
    enc_msg = []
    r = 0
    msg.each do |char|
      if r == 4
        r = 0
      end
      if r == 0
        rot = a_rotation
      elsif r == 1
        rot = b_rotation
      elsif r == 2
        rot = c_rotation
      elsif r == 3
        rot = d_rotation
      end
      # binding.pry
      rot_num = char_map.index(char) + rot
      while rot_num > char_map.length
        rot_num = rot_num - char_map.length
      end
      enc_char = char_map[rot_num]
      enc_msg << enc_char
      r += 1
    end
    enc_msg.join
  end

end
