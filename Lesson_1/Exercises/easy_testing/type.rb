require 'Minitest/autorun'


class NumTest < MiniTest::Test
  def test_class
    @a = Numeric.new
    assert_instance_of Numeric, @a
  end
end