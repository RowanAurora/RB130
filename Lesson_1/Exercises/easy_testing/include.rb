require 'MiniTest/autorun'

class ListTest < MiniTest::Test
  def test_include
    assert_includes ['abc', 'yz'], "xyz"
  end
end