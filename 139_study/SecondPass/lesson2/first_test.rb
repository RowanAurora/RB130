require 'minitest/autorun'

require_relative 'first'

class CatTest < Minitest::Test
  def test_meow
    cat = Cat.new
    assert_equal(cat.meow, "meow")
  end
end