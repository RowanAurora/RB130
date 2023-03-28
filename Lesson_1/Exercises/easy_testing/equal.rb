require 'Minitest/autorun'

class DownTest < MiniTest::Test
  def test_downcase
    assert_equal('xyz', "XYZ".downcase)
  end
end

# Expected value first, actual value second