require './lib/rotation'
require './lib/charmap'

class EncryptDecrypt
  attr_reader :switch,
              :in_message,
              :key,
              :date,
              :charmap

  def initialize(switch, in_message, key, date)
    @switch = switch
    @in_message = in_message.split(//)
    @key = key
    @date = date
    @charmap = CharMap.new.charmap
  end

  def rotation
    Rotation.new(@key, @date)
  end

  def output
    out_message = []
    in_message.each_with_index do |char, index|
      rot = get_rotation(index)
      if switch == 'enc'
        rot_num = encrypt_switch(char, rot)
      elsif switch == 'dec'
        rot_num = decrypt_switch(char, rot)
      end
      out_character = charmap[rot_num]
      out_message << out_character
    end
    out_message.join
  end

  def encrypt_switch(char, rot)
    rot_num = charmap.index(char) + rot
    while rot_num >= charmap.length
      rot_num = rot_num - charmap.length
    end
    rot_num
  end

  def decrypt_switch(char, rot)
    rot_num = charmap.index(char) - rot
    while rot_num < 0
      rot_num = rot_num + charmap.length
    end
    rot_num
  end

  def get_rotation(index)
    offset = index % 4
    return rotation.a_rotation if offset == 0
    return rotation.b_rotation if offset == 1
    return rotation.c_rotation if offset == 2
    return rotation.d_rotation if offset == 3
  end

end
