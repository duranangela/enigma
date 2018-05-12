class Encrypt
  attr_reader :msg,
              :key,
              :date

  def initialize(msg, key, date)
    @msg = msg
    @key = key.rjust(5, '0')
    @date = date.to_s
  end

  def output
    msg
  end

end
