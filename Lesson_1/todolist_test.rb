require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'todo'

class TodoListTest < MiniTest::Test

  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  def test_to_a
    assert_equal(@todos, @list.to_a)
  end
  # Your tests go here. Remember they must start with "test_"
  def test_size
    assert_equal(@list.size, 3)
    @list.shift
    assert_equal(@list.size, 2)
  end

  def test_first 
    assert_equal(@todo1, @list.first)
  end
  
  def test_last
    assert_equal(@todo3, @list.last)
  end

  def test_shift
    todo = @list.shift
    assert_equal(@todo1, todo)
    assert_equal([@todo2, @todo3], @list.to_a)
  end

  def test_pop
    todo = @list.pop
    assert_equal(@todo3, todo)
    assert_equal([@todo1, @todo2], @list.to_a)
  end

  def test_done
    assert_equal(false, @list.done?)
  end

  def test_typeerror
    assert_raises(TypeError) { @list << "bing" }
    assert_raises(TypeError) { @list << 1 }
    assert_raises(TypeError) { @list << [1, 2] }
    assert_raises(TypeError) { @list << {1 => "hi", 2 => "no"} }
  end

  def test_add
    @todo4 = Todo.new("Scream")
    @list << @todo4
    assert_equal(@todo4, @list.last)
  end
  
  def test_add_two
    @todo4 = Todo.new("Scream")
    @list.add(@todo4)
    assert_equal(@todo4, @list.last)
  end

  def test_item_at
    assert_equal(@todo1, @list.item_at(0))
    assert_equal(@todo2, @list.item_at(1))
    assert_equal(@todo3, @list.item_at(2))
    assert_raises(IndexError) { @list.item_at(5)}
  end

  def test_mark_done_at 
    assert_raises(IndexError) { @list.mark_done_at(10) }
    @list.mark_done_at(0)
    assert_equal(@todo1.done?, true)
    assert_equal(@todo2.done?, false)
    assert_equal(@todo3.done?, false)
  end
  
  def test_mark_undone_at
    assert_raises(IndexError) { @list.mark_undone_at(10) }
    @list.mark_all_done
    @list.mark_undone_at(1)
    assert_equal(@todo1.done?, true)
    assert_equal(@todo2.done?, false)
    assert_equal(@todo3.done?, true)
  end

  def test_done!
    @list.done!
    assert_equal(@todo1.done?, true)
    assert_equal(@todo2.done?, true)
    assert_equal(@todo3.done?, true)
  end

  def test_remove_at
    assert_raises(IndexError) { @list.remove_at(10) }
    @list.remove_at(1)
    assert_equal(@list.to_a, [@todo1, @todo3])
  end

  def test_to_s
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT

    assert_equal(output, @list.to_s)
 
    @list.mark_done_at(1)
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [ ] Buy milk
    [X] Clean room
    [ ] Go to gym
    OUTPUT

    assert_equal(output, @list.to_s)
  
    @list.mark_all_done
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [X] Buy milk
    [X] Clean room
    [X] Go to gym
    OUTPUT

    assert_equal(output, @list.to_s)
  end

  def test_each 
    result = []
    @list.each { |todo| result << todo }
    assert_equal(@list.to_a, result.to_a)
  end
  
  def test_each 
    same_obj = @list.each { |todo| nil }
    assert_equal(@list.to_a, same_obj.to_a)
  end

  def test_select
    @list.mark_done_at(1)
    same_obj = @list.select { |todo| todo.done? }
    assert_equal(@list.to_a[1], same_obj.to_a[0])
  end

  def test_find_by_title
    a = @list.find_by_title("Buy milk")
    assert_equal(a, @todo1)
  end

  def test_all_done
    @list.mark_done(1)
    @todo2.done = true
    a = @list.all_done
    assert_equal(a.to_a, [@todo2])
  end

  def test_all_not_done
    @list.mark_done(1)
    @todo2.done = true
    a = @list.all_not_done
    assert_equal(a.to_a, [@todo1, @todo3])
  end

  def test_mark_done
    @list.mark_done("Buy milk")
    assert_equal(@todo1, @list.all_done.to_a[0])
  end

end