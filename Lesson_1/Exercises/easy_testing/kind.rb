require 'MiniTest/autorun'

class KindTest < MiniTest::Test

  def test_kind
    assert_kind_of Numeric, 1
  end
end