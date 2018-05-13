require './lib/rotation'
require 'pry'

class Decrypt
  attr_reader :enc_msg,
              :key,
              :date,
              :char_map

  def initialize(enc_msg, key, date)
    @enc_msg = enc_msg.split(//)
    @key = key
    @date = date
    @char_map = "abcdefghijklmnopqrstuvwxyz0123456789 .,".split(//)
  end

  def rotation
    Rotation.new(@key, @date)
  end

  def output
    dec_msg = []
    rot_inc = 0
    enc_msg.each do |char|
      if rot_inc == 4
        rot_inc = 0
      end
      if rot_inc == 0
        rot = rotation.a_rtn
      elsif rot_inc == 1
        rot = rotation.b_rtn
      elsif rot_inc == 2
        rot = rotation.c_rtn
      elsif rot_inc == 3
        rot = rotation.d_rtn
      end
      rot_num = char_map.index(char) - rot
      while rot_num < 0
        rot_num = rot_num + char_map.length
      end
      dec_char = char_map[rot_num]
      dec_msg << dec_char
      rot_inc += 1
    end
    dec_msg.join
  end


end
