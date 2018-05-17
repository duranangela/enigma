class CharMap

  def charmap
    upper_case = ('A'..'Z').to_a
    lower_case = ('a'..'z').to_a
    numbers = (0..9).to_a.join.chars
    extra_characters = ' !@#$%^&*()[],.<>;:/?\|'.split(//)
    upper_case + lower_case + numbers + extra_characters
  end

end
