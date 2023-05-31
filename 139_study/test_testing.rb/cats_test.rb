require "minitest"
require "minitest/autorun"

require_relative 'cats'

class CatsTest < MiniTest::Test
  def test_meow
    a = Cat.new
    assert_equal("meow", a.meow)
  end
end

class DogTest < MiniTest::Test
  def test_bark
    b = Dog.new
    assert_equal("Bark", b.bark)
  end
end