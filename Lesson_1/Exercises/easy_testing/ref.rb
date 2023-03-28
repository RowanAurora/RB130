require 'MiniTest/autorun'

class ListTest < MiniTest::Test
  def test_include
    refute_includes ['abc', 'yz'], "xyz"
  end
end