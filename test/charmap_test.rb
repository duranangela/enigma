require './test/test_helper'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/charmap'

class CharMapTest < Minitest::Test

  def test_it_can_map_characters
    charmap = CharMap.new.charmap
    assert_equal 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789 !@#$%^&*()[],.<>;:/?\|'.split(//), charmap
  end

end
