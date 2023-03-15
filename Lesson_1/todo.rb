# This class represents a todo item and its associated
# data: name and description. There's also a "done"
# flag to show whether this todo item is done.

class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end

  def ==(otherTodo)
    title == otherTodo.title &&
      description == otherTodo.description &&
      done == otherTodo.done
  end
end

class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
    
  end

  # rest of class needs implementation
  def add(todo)
    raise TypeError, "Not Todo object" unless todo.instance_of? Todo
    @todos << todo 
  end
 
  alias :<< :add

  def size
    @todos.size
  end

  def first
    @todos.first
  end

  def last 
    @todos.last
  end

  def to_a
    @todos.clone
  end 

  def done?
    @todos.all? do |todo|
      todo.done
    end
  end

  def item_at(idx)
    raise IndexError if idx > @todos.size
    @todos[idx]
  end
  
  def mark_done_at(idx)
    raise IndexError if idx > @todos.size
    @todos[idx].done!
  end
  
  def mark_undone_at(idx)
    raise IndexError if idx > @todos.size
    @todos[idx].undone!
  end
  
  def remove_at(idx)
    raise IndexError if idx > @todos.size
    @todos.delete_at(idx)
  end

  def done!
    @todos.each { |todo| todo.done! }
  end

  def shift
    @todos.shift
  end

  def pop
    @todos.pop
  end

  # def to_s 
  #   puts "---- #{title} ----"
  #   @todos.each { |todo| puts todo }
  # end

  def to_s
    text = "---- #{title} ----\n"
    text << @todos.map(&:to_s).join("\n")
    text
  end

  def each 
    @todos.each do |todo|
      yield(todo)
    end
    self
  end

  def select 
    counter = 0
    result = TodoList.new(self.title)
    while counter < @todos.size
      result << @todos[counter] if yield(@todos[counter])
      counter += 1
    end
    result
  end

  def find_by_title(string)
    object = nil 
    each do |todo|
      object = todo if todo.title == string
    end
    object
  end

  def all_done 
    select do |todo|
      todo.done?
    end
  end

  def all_not_done
    select do |todo|
      todo.done == false
    end
  end

  def mark_done(string)
    # find_by_title(string) ? find_by_title(string).done! : nil
    each do |todo|
      todo.done! if string == todo.title
    end
  end

  def mark_all_done
    # done!
    each do |todo|
      todo.done!
    end
  end

  def mark_all_undone
    # undone!
    each do |todo|
      todo.undone!
    end
  end
  
end


todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")

list = TodoList.new("Today's Todos")
list.add(todo1)
list.add(todo2)
list.add(todo3)

todo1.done!

puts list.mark_all_undone   # you need to implement this metho
puts list