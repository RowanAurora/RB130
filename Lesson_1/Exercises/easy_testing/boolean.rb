require 'minitest/autorun'

class BooleanTest < MiniTest::Test
  def test_odd?
    value = 3
    assert value.odd?, 'value is not odd'
  end
end