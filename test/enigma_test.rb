require 'minitest/autorun'
require 'minitest/pride'
require './lib/enigma'

class EnigmaTest < Minitest::Test

  def test_it_exists
    e = Enigma.new
    assert_instance_of Enigma, e
  end

  def test_it_makes_a_five_digit_key
    e = Enigma.new
    assert_equal 5, e.random_key.length
  end

  def test_it_gives_todays_date
    e = Enigma.new
    assert_equal Date.today.strftime('%m%e%y'), e.today
  end

  # Should we test this here if we're already testing it in the encrypt_test.rb file?
  #  def test_it_encrypts
  #   e = Enigma.new
  #
  #   assert_equal 'my_message', e.encrypt('my_message')
  # end
end
