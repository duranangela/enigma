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

  def test_it_gives_todays_date_in_the_right_format
    e = Enigma.new
    assert_equal Date.today.strftime('%m%e%y'), e.today
  end

  def test_it_encrypts_with_key_and_date
    e = Enigma.new
    assert_equal "a3,2zf7xzepl137jt3kotx", e.encrypt('secret message ..end..', '12345', '020315')
  end


  def test_it_decrypts_with_key_and_date
    e = Enigma.new
    assert_equal 'secret message ..end..', e.decrypt("a3,2zf7xzepl137jt3kotx", '12345', '020315')
  end

  def test_it_cracks_with_date
    e = Enigma.new
    assert_equal 'secret message ..end..', e.crack("a3,2zf7xzepl137jt3kotx", '020315')
  end
  
  # Should we test this here if we're already testing it in the encrypt_test.rb file?
  #  def test_it_encrypts
  #   e = Enigma.new
  #
  #   assert_equal 'my_message', e.encrypt('my_message')
  # end
end
