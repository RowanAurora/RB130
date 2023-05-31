rejuvenatingserendipity@gmail.com
# class Link
#   attr_reader :inventory

#   def initialize
#     @inventory = []
#   end

#   def buy(item)
#     pay_money
#     inventory << item
#   end
# end

# class Enemy
#   def initialize
#     hp = (10..100).to_a.sample
#     mp
#     armour
#     attack
#   end
# end

# class Spider < Enemy 
# end

# class Npc
#   def initialize(name)
#     @name = name
#   end
# end

# class Beedle
#   def initialize
#     @merchandise = ['ham', 'sword', 'wheat', 'junk', 'medicine']
#   end
#   def sell 
#     10
#   end
# end

# def make_alive
#   link = Link.new 
#   zelda = Npc.new("Zelda")
# end

# # test.rb

# class TestBeedle
#   def test_sell
#     assert_equal 10 , sell
#   end
# end
# BAM = [1, 2, 3, 4, 5, 6]

# def cats(&var) # convert to Proc obj
#   var.call(BAM)
# end
  
#   name = "Rowan"
#  blocky = proc { |item, item2| puts "#{item} #{name} "}

#  BAM.each &blocky
 

#  name.upcase!

#  BAM.each &blocky
#  - when applied to an argument for a method, ruby attempts to convert that argument to a block
#     -if that object is a proc, this happens automatically when applied
#     - if not a proc, ruby first attempts to call to_proc on that object
#   - when applied to a method PARAMETER, ruby converts to a proc. 

# https://leetcode.com/problems/container-with-most-water/solutions/?q=ruby&orderBy=most_relevant

How blocks work, and when we want to use them.
- Blocks are closures
  - closures are chunks of code that can be passed around for later use.
  - closures maintain thier bindings. 
    - bindings are the closure''s relation to variables and artifacts (Constants, variables, methods, expression)
    - binding is the state of the surrounding environment.  

    def counter # => implementation
      count = 0
      Proc.new { count += 2 }
    end
    
    c1 = counter()
    puts c1.call # Output: 2 # => Execution
    puts c1.call # Output: 4
    
    c2 = counter()
    puts c2.call # Output: 2

    87 
    83
    84
    88
    83
    84
    89
    83
    84
    91
    83
    84
    92  
    83
    84


    In this example, the counter method returns a Proc object, which is a closure. The closure captures the value of the count variable at the time it is defined. Each time the closure is called with call, it increments the count variable and returns its current value.

We create two instances of the closure counter(), c1 and c2. Each instance has its own count variable, so calling c1.call increments c1's count, while leaving c2's count unaffected.

Blocks and variable scope
  - variables created in the outer scope are available in the inner scope, but not vice versa.
  - Look out for variable shadowing! Nameing become more important when dealing with larger code bases. Its easier to shadow 200 lines later than 20 lines later.

Write methods that use blocks and procs

```ruby 
def shout(name)
  puts yield(name) if block_given?
  "WHATS YOUR NAME"
end

def other_shout(arr)
  if block_given?
    arr.each do |item|
      yield(item)
    end
  else
    puts "NAME"
  end
end

 shout("amy") { |name| name.upcase }
```


Understand that methods and blocks can return chunks of code (closures)

def counter # => implementation
  count = 0
  Proc.new { count += 2 }
end

# => #<Proc:0x00007f946c7d8360 solution.rb:145>


Methods with an explicit block parameter


Arguments and return values with blocks
# 
blocko.call("name") 
yield("name") 

Yielding with an argument

Sometimes, the block we pass in to a method requires an argument. Note that the block itself is an argument into a method, so the fact that the block requires an argument adds an additional layer of complexity. But you've already been writing blocks that take an argument for a long time.

# method implementation
def increment(number)
  if block_given?
    yield(number + 1) #arugment passed to the block
  end
  number + 1
end

# method invocation
increment(5) do |num|
  puts num
end
The above method invocation outputs 6. Notice the use of block_given?, which allows us to continue to call the method without a block. Let's trace the code execution in the above code snippet.

Execution starts at method invocation on line 10.
Execution moves to the method implementation on line 2, which sets 5 to the local variable number, and the block is not set to any variable; it's just implicitly available.
Execution continues on line 3, which is a conditional.
Our method invocation has indeed passed in a block, so the conditional is true, moving execution to line 4.
On line 4, execution is yielded to the block (or the block is called), and we're passing number + 1 to the block. This means we're calling the block with 6 as the block argument.
Execution jumps to line 10, where the block parameter num is assigned 6.
Execution continues to line 11, where we output the block local variable num.
Execution continues to line 12, where the end of the block is reached.
Execution now jumps back to the method implementation, where we just finished executing line 4.
Execution continues to line 5, the end of the if.
Line 6 returns the value of the incremented argument to line 10.
The program ends (the return value of #increment is not used)

Blocks return the result of the last expression
 

When can you pass a block to a method

&:symbol
.map(&:upcase) => to_proc / to_block
(&blocko) => to_block

Arity of blocks and methods

rowanivordraws@gmail.com
