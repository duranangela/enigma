require './test/test_helper'
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

  def test_it_makes_random_keys
    e = Enigma.new
    array = []
    100.times {array << e.random_key}
    assert array.length == array.uniq.length
  end

  def test_it_gives_todays_date_in_the_right_format
    e = Enigma.new
    assert_equal Date.today.strftime('%m%e%y'), e.today
  end

  def test_it_encrypts_with_key_and_date
    e = Enigma.new
    assert_equal '@#*I/$:a!)NIx8;;@Jbox(#oK', e.encrypt('this is so secret ..end..', '12345', '051618')
  end

  def test_it_decrypts_with_key_and_date
    e = Enigma.new
    assert_equal 'this is so secret ..end..', e.decrypt('@#*I/$:a!)NIx8;;@Jbox(#oK', '12345', '051618')
  end

  def test_it_cracks_with_date
    e = Enigma.new
    assert_equal 'this is so secret ..end..', e.crack('@#*I/$:a!)NIx8;;@Jbox(#oK', '051618')
  end
end
