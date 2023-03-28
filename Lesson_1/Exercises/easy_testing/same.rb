require 'MiniTest/autorun'

class Lists 
  def process  
    "WOW"
  end
end

class ObjTest < MiniTest::Test 

  def test_same
    list = Lists.new
    assert_same list, list.process
  end
end