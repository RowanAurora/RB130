require "MiniTest/autorun"

class EmptyTest < MiniTest::Test
  def test_empty
    list = []
    assert_empty list
  end
end