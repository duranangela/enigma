class Char_map

  def char_map
    lower_case = ("a".."z").to_a
    numbers = (0..9).to_a.join.chars
    extra_characters = ' .,'.split(//)
    lower_case + numbers + extra_characters
  end

end
