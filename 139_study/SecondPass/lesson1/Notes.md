Blocks are all over ruby, in the previous courses in { } and do..end blocks used in calling methods. 

Blocks are a 'closures' which is a chunk of code that is made available for later reuse.
Closures have a binding, which is a set of objects and artifacts from where it is created.

In this unit we use blocks and procs, and do some work with lambda. They can be called on methods and passed INTO methods. 

in ruby the main ways we are using are 

1. Instantiating an object from Proc class
2. Using lambdas
3. Using blocks

The block is an ARGUMENT to the method call. We pass in a block to a method in cases like
`[1, 2, 3].each { |num| puts num }`

Blocks delay specifics of a method until invocation, not just in implementation. 
Blocks are just arguments passed to a method at invocation time. 

Blocks are by default optional. If we use the yield keywork, they become required. 
To get around this, we used the `block_given?` method with an if clause

Implementation if `def`
Invocation/execution is using the method or code. 

Arguments passed to yield are passed to the block as parameters. 
  - block parametres should avoid variabels shadowing.

Yield returns the return of the block

Block parameters are ordered according to argument. If there are two arguments, and one parameter only the first is used.

If we pass an array to a block, it is passed as an array. If we want to pass each item individually, we should pass each individually through iteration.

Methods have strict arity although blocks are treated as optional arguments.
Procs and blocks have lenient arity
lambdas are a subset of blocks that have a strict arity

yield blocks are good for `sandwhich code` which is when we do something, implement the block, then do something else.
opening files, do things, close files is a common example of this. 

When to use blocks?

1. Defer some implementation code
  - delay decisions to the method users.
2. Sandwich code
```ruby 
    def time_check 
      time_before = time.now 
      yield
      time_after = time.now
    end

  time_check { sleep(3)}
```

Methods with an explicit block parameter.

```ruby
  def cats(&block) # explicit block parametre &
    %i(1 2 3 ).each &block
  end

  a = proc { |item| puts item }

  cats(&a) # passing in a block using &
```

```ruby
def test2(block)
  block.call("meow")
end

def cats(&block)
  %i(1 2 3).each &block
  test2(block)
end

a = proc { |item| puts " a #{item}" }

dog = cats(&a)
```

Closures, including Procs and blocks and lambdas maintain their scope as they are passed around. 
 
We can return Proc/lambda objects from methods and other objects but we can't return blocks. 
We can use this to create multiple instantiates from the Proc class that contain the same code but are nonetheless separate. 

Blocks and variable scope revisit
blocks create a new scope for local variables where outter scope variables are accessible on the inner scope, but not vice versa

This is only for LOCAL variables, methods don't follow the same rules

Closure is a chunk of code that can be passed around for later execution.
In order for the code to be executed, you have to consider the binding in which its created. - IN ruby were talking about blocks and procs/lambdas

Procs maintain their binding when they are passed around. 
If we change the value of a variable that is in the binding later, the change will be reflected by the closure. 





unary&

If we pass an argument to a method using unary &, it will be interpreted as a block.
even if the method doesnt accept a direct argument, we can use this to pass a block.

You can shortcut calling methods with blocks by using the symbol to proc trick. Its good to know what is happening under the hood.


lambdas usage and arity


Minitest

Minitest is a bundled gem, shipped with default ruby but is separate and can be deleted in necessary.

Vocabulary to know:

Test suite: The set of tests that accompanies the program or app. All tests for a project

Test: context in which tests are run. A test can contain multiple assertions.

Assertion: actual verification step to confirm that the data is returned by the program or app is what is expected. multiple can be made per test.

aside, Minitest can be written as MiniTest or Minitest, even in code.

```ruby 
require 'minitest/autorun'  #1

require_relative 'car'  #3

class CarTest < MiniTest::Test #5
  def test_wheels
    car = Car.new
    assert_equal(4, car.wheels)
  end
end #10
```

line one `require 'minitest/autorun' loads all the files needed from minitest, the onky requirment.
On line 3, we require the file that were testing using `require_relative 'car'` 
Line 5 is the test definition. naming convention specifies 'test_wheels1 not `wheels_test`
Line 8 contains the assertion, assert_equal, checking hat car.wheels returns 4. 

assert_equal is the basis for most tests, although a lot of assertations and refutations are more specific.
assert_equal is an instance method that is inherited

Seed determines the order test happen in, generally in random order but can be controled.

`.` means the test was run and nothing went wrong. 
S means skip
F means failure. 

If you fail a test, minitest will record and let you know.

Minitest-reporters gem can make the test output more legible. 

A second style or test syntax, apart from assert is expectation syntax. (spec-style)
Tests are grouped into describe blocks and individual testa re written with the `it` method. Instead of assertions, we use expectation matchers. It uses a quasi-dsl

Spec or assert is a style choice and leads to the same results. 
in my opinion, assert reads more clearly.


Rundown:
Minitest is a test library that ships with ruby

steps: 
create a test file
create test class by subclassing minitest::test
create a test by creating na instance method prepended with test_
create assertions in that test. 
use minitest-reporters
Skip, or be aware of skips


assert_equal(expected_value, actual_value) is the proper style syntax.

If you feel you need a certain assertation, it almost certainly exists. failing that, assert equal can likely be used to confirm what you need.

Seat approach. 

Set up - instantiate needed objects
Execute the code in the test
Assert the code did the correct thing
Tear down and clean up any lingering artifacts

We can create a setup method that is run before everytest, to instantiate objects if the tests all use the same objects. This can save a lot of lines of code. 

We have an inverse method called teardown, called after each test.For closing any fils or database connections or logging information. 

We dont always need step 1 and 4 to test but always need 2 and 3

Testing equality. 

Assert_equal is one of the most usefull assertations, but we must know how it is testing for equality.
WIth assert equal we are testing for value equality. If we wish to test for object equality(same object) we need to use assert_same

With custom classes, we need a == method in order to use assert equal, because we need to tell what to compare. An instance of a class can have multiple values in the form of a state/instance variable.

Code coverage

To test code coverage, use at the top of the TEST file
require 'simplecov'
SimpleCov.start

This creates a coverage file, the index.html file contains the appropriate information. 
This tests how much of the code is tested

RUBY TOOLBOX

Bundler:
Bundler is a dependency manager. It manages gem dependencies according to the current version of ruby. Bundler itself is a gem, that is installed along with ruby after version 2.5. 

Rake:

Rake automates many common functions that are required to build test package and install programs. It comes with any modern ruby preinstalled.
Rake is a task automator. You can choose which tasks it runs under which commands to simplify batch tasks that must be run repeatedly. 