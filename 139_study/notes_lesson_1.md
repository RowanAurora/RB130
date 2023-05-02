# BLOCKS

## closures

A ___closure___ is a general programming concept about saving a chunk of code for later re use
  - In ruby, this takes the forms of ___blocs, procs, and lambdas___. 
  - Its called a closure because it, in theory, incloses a set of variables, methods and other artifacts. Similar to a method that isnt defined with a name. 
  - The reference to the surroundings its created in is called its binding

## calling Methods with blocks
___blocks___ are essential in ruby code. The code in a do..end or {..} are blocks. 
  - common methods such as each, select and map use blocks to determine what the function of the methods are.

## writing methods that take blocks
By default in ruby, every method takes a block. Some methods just ignore the block. 
  - using the `yeild` key word allows the method to respond to a block. literally yield to the block at the point of use in the method.
  - Does not affect the use of arguments. 
  - If yield is used by itself, a block is now required
    - To make use of a block optional use the block_given? method. `yield if block_given?
  
### implementation vs invocation
  - implementation is the writing of the method, where it is defined
  - execution starts at method invocation
  - this difference is important to know when using extensive blocks where the block might be longer then the method itself.

## Arity

Blocks themselves can require an argument. The rules regarding how many arguments must be passed to the block is called __arity__

### block arity
  - Blocks have ___lenient arity___ which means you can pass in less or more arguments to the block and ruby will accept it. It will either ignore or use them depending on the block. 
    - Procs also have lenient arity
  - Methods and lambdas have ___strict arity___ which means you must pass EXACTLY the number of arguments specified. 
      - there are exceptions you can write, such as optional arguments. 
  - Arguments can become more and more complex, but these are the basic rules.

## Use cases for blocks
  1. defer some implementation code to the method invocation.
    - There are method implementors and method users (often the same person).
    - blocks allow uncertainty in how the method will be used by the method user and leaves some choices to them. 
    The generic way some methods are written make them extremely useful and adaptable, such as each or map. 
    - If you find yourself using a method in a lot of different ways with small tweaks, blocks can be a good option. 
  2. Sandwich Code. A before and after operation
  - Using blocks allows for a generic before and after. The block can decide what the before and after is.
  - Can use sandwich code to time an operation laid out in a block, for example
  - Sandwich code is also usefull for resource management. Opening a file, doing stuff, then closing a file is a common operation.

## Methods with an Explicit Block parameter

  - Using yield involves passing blocks  ___implicitly___
  - Methods can be defined to take a block ___Explicitly___
    - Using `&` before the parameter in the method definition is how you require a explicit block.
  - This converts the argument to a simple `Proc` object.
  - Using Proc objects allows for additional flexibility.
    - you can pass the proc object as an argument to another method in the method.
  - You can invoke the block with #.call
    - you can pass arugments to the block by passing them to call
  
  ## Using Closures

  - Using closures can simulate some of the functionality of custom class objects. 
  - each Proc object can have an independant copy of a variable inside a method, in the case of 
   ```ruby 
  def seq
    counter = 0
    Proc.new { counter += 1 }
  end

  s1 = sequence
  s1.call # => 1
  s1.call # => 2
  s1.call # => 3

  s2 = sequence
  s2.call # => 1
  s2.call # => 2

  s1.call # => 4
  ```
  the counter variable is separate in each object. A proc object is returned by the method,
  so s1 and s2 are variables assigned to proc objects.

  Summery:

  Blocks are just of the ways that ruby implements closures
    -closures are a chunk of code to be passed around later that encloses artifacts of where it is created, for later reference
  Blocks can take arguments. They have lenient arity and dont complain about varying numbers of arguments
  Blocks return a value - like all expressions in ruby
  Blocks allow us to delay some implementation of methods to when we used them (invocation)
    -This allows for more generic methods that provide increased flexibility
  Blocks are a good use case for `sandwich code`, like opening and closing a file.
  Methods and blocks can return a `proc` or a lambda

  ## Blocks and Variable scopes

  ### Local variable scope

  Local variable scope in a block contexts means that ruby can access any variable from an outer scope in an inner scope but not vice versa. 
    - Blocks create a new inner scope
  
  Procs keep track of their surroundings. In this context, if a variable in its original scope is reassigned, it will reflect that change. It looks like a custom scope
    - the binding also includes any in scope objects
    -methods, constants, other blocks are part of the binding
  If a object is initialized after a Proc is created, it won't be in scope

  Bindings and closures are the core of variable scoping, the hidden mechanism. 

  ## Symbol to Proc

  Methods that don't take arguments can be passed to iterative methods using the & flag
    - This allows use to transform the elements inside the array according to the given method as a shortcut
  
    -This is distinct from explicit blocks, which have te & in the parameter field aswell.
  In this context, & is an operator that transform the object to a proc
    - ie (&:to_s) calls to_proc on to_s. 
      - :to_s is a symbol

  ## Yield in practice

  ```ruby
  def cats(name)
    yield(name) if block_given? #could also be name = yield(name) if block_given?
    puts "#{name} meows!"
  end

  cats('jAcK') { |n| n.capitalize! }

  # Jack meows!
  # => nil
  ```

  

