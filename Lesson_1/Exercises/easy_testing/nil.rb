require 'MiniTest/autorun'

class NilTest < MiniTest::Test
  def test_nil
    value = nil 
    assert_nil value
  end
end