require './test/test_helper'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/charmap'

class CharMapTest < Minitest::Test

  def test_it_can_map_characters
    charmap = CharMap.new.charmap
    assert_equal ("a".."z").to_a + ('0123456789').split(//) + ' .,'.split(//), charmap
  end

end
