# require './lib/rotation'
# require './lib/charmap'
# require 'pry'
#
# class Decrypt
#   attr_reader :encrypted_message,
#               :key,
#               :date,
#               :charmap
#
#   def initialize(encrypted_message, key, date)
#     @encrypted_message = encrypted_message.split(//)
#     @key = key
#     @date = date
#     @charmap = CharMap.new.charmap
#   end
#
#   def rotation
#     Rotation.new(@key, @date)
#   end
#
#   def output
#       decrypted_message = []
#       encrypted_message.each_with_index do |char, index|
#         rot = get_rotation(index)
#         rot_num = charmap.index(char) - rot
#         while rot_num < 0
#           rot_num = rot_num + charmap.length
#         end
#         decrypted_character = charmap[rot_num]
#         decrypted_message << decrypted_character
#       end
#       decrypted_message.join
#     end
#
#     def get_rotation(increment)
#       offset = increment % 4
#       return rotation.a_rotation if offset == 0
#       return rotation.b_rotation if offset == 1
#       return rotation.c_rotation if offset == 2
#       return rotation.d_rotation if offset == 3
#     end
#
# end

  # def output
  #   decrypted_message = []
  #   rot_increment = 0
  #   encrypted_message.each do |char|
  #     if rot_increment == 4
  #       rot_increment = 0
  #     end
  #     if rot_increment == 0
  #       rot = rotation.a_rotation
  #     elsif rot_increment == 1
  #       rot = rotation.b_rotation
  #     elsif rot_increment == 2
  #       rot = rotation.c_rotation
  #     elsif rot_increment == 3
  #       rot = rotation.d_rotation
  #     end
  #     rot_total = charmap.index(char) - rot
  #     while rot_total < 0
  #       rot_total = rot_total + charmap.length
  #     end
  #     decrypted_character = charmap[rot_total]
  #     decrypted_message << decrypted_character
  #     rot_increment += 1
  #   end
  #   decrypted_message.join
  # end
