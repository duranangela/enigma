require 'minitest/autorun'
require 'minitest/pride'
require './lib/rotation'

class RotationTest < Minitest::Test

  def test_it_exists
    rotation = Rotation.new('12345', '020315')
    assert_instance_of Rotation, rotation
  end

  def test_it_exists_with_different_key_and_date
    rotation = Rotation.new('54321', '123178')
    assert_instance_of Rotation, rotation
  end

  def test_it_has_attributes
    rotation = Rotation.new('12345', '020315')
    assert_equal '12345', rotation.key
    assert_equal '020315', rotation.date
    assert_equal '9225', rotation.offset
  end

  def test_it_has_attributes_with_different_key_and_date
    rotation = Rotation.new('54321', '123178')
    assert_equal '54321', rotation.key
    assert_equal '123178', rotation.date
    assert_equal '9684', rotation.offset
  end

  def test_the_rotations
    rotation = Rotation.new('12345', '020315')
    assert_equal 21, rotation.a_rotation
    assert_equal 25, rotation.b_rotation
    assert_equal 36, rotation.c_rotation
    assert_equal 50, rotation.d_rotation
  end

  def test_it_can_have_different_rotations
    rotation = Rotation.new('54321', '123178')
    assert_equal 63, rotation.a_rotation
    assert_equal 49, rotation.b_rotation
    assert_equal 40, rotation.c_rotation
    assert_equal 25, rotation.d_rotation
  end

end
