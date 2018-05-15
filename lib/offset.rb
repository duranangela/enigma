class Offset

  def offset(date)
    date_code = (date.to_i ** 2).to_s
    date_code[-4..-1]
  end

end
