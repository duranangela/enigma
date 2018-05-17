class Rotation
  attr_reader :key,
              :date,
              :offset

  def initialize(key, date)
    @key = key
    @date = date
  end

  def offset
    date_code = (date.to_i ** 2).to_s
    date_code[-4..-1]
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

end
