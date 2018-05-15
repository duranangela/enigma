class CharMap

  def charmap
    lower_case = ("a".."z").to_a
    numbers = (0..9).to_a.join.chars
    extra_characters = ' .,'.split(//)
    lower_case + numbers + extra_characters
  end

end
