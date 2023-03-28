require 'Minitest/autorun'
class NoExperienceError < StandardError; end

class Employee
  def hire
    raise NoExperienceError, "sorry"
  end
end

class ExceptionTester < MiniTest::Test
  def test_error
    employee = Employee.new
    assert_raises NoExperienceError do 
      employee.hire
    end
    end
  end