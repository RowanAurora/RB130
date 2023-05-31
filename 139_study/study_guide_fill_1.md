# Blocks

### Closures, binding, and scope
- Closures are, basically, a chunk of code that is enclosed so it can be passed around for later use. Blocks, Procs and lambdas are the main way the ruby implements closures. 
- Closures maintain their binding, which is its relation to artifacts where it is created. Variables, constants and other objects retain their relation, this is called the binding. 

### How blocks work, and when we want to use them.
- Blocks works, in ruby through the yield key word. It allows for delaying details of an operation from implementation to execution. We want to use them where we want to decide at a later point the specific use(s) of a method, or to create a more flexible generic method.
### Blocks and variable scope
- Blocks create their own scope. The inner scope can access the outerscope, but the outerscope can't access the inner scope. We also have to be careful when naming our parameter to avoid variable shadowing and confusion.
### Write methods that use blocks and procs
- Methods primarily use blocks and procs. Blocks are primarily used with the yield keyword
 Look more at writing Procs.

```ruby
def cats(name)
  name = yield(name) if block_given?
end

cats("jUnE") { |name| name.capitalize}
```

### Understand that methods and blocks can return chunks of code (closures)
- Methods return the last expression in their definition. This can be a closure, often in the form of a Proc object. Blocks can also return a closure based on the content of the block.
look into
### Methods with an explicit block parameter
- A method with an explicit bloc parameter requires a block object as an argument. 
when the parameter is written with &param, this is an explicit block parameter. 
### Arguments and return values with blocks 
- On line 4, execution is yielded to the block (or the block is called), and we're passing number + 1 to the block. This means we're calling the block with 6 as the block argument.

yield(number + 1) # argument passed to the block
### When can you pass a block to a method
-  You can pass a block to a method when
    - There is an explicit requirement to do so `example_method(&block)`
    - It is stored as a closure. We need to store as a block, proc or lambda to pass to a method
    - Essentially any time that a block is a compatible object. We cant pass it where, for example, we call to_i on the argument. 
### &:symbol
- & symbol has two different meanings
  - when applied to an argument for a method, ruby attempts to convert that argument to a block
    -if that object is a proc, this happens automatically when applied
    - if not a proc, ruby first attempts to call to_proc on that object
  - when applied to a method PARAMETER, ruby converts to a proc. essentially the reverse of the first operation. 
### Arity of blocks and methods
- blocks have lenient arity, methods have strict arity.
  - strict arity means that you need to pass the prescribed number of arguments exactly, or ruby will through an error
  -lenient arity means theres is flexibility with the number or arguments that can be passed. Less, or more is okay and ruby will deal with it. 


# Testing With Minitest

### Testing terminology
- Equality, assertions, tests, setup, teardown
-Test suite
-test
-assertion
-refutations

### Minitest vs. RSpec
- Mini test is rubys default testing library and is part of the standard library.
  - its a bundled gem, installed by default.
  - has a dsl, but primarily uses regular ruby.
-Rspec is a dsl (domain specific language) that allows near plain english usage, at the cost of simplicity
### SEAT approach
- Set up
  - initialize any objects needed for the tests, opening files, etc
- execute
  -perform the tests, get assertions, refutations etc
- assert
  - is x true
- teardown
  - clean up artifacts, close files etc.


setup method can be used when the set up for all the tests are the same.  we must use instance variables so they are available throughout the class, not just in the setup method. This is ran before each test. Its twin, teardown runs after each test.
  - if we need different objects, we can use local variables in the test instead of the instance variables. 
### Assertions
- Assertions are tests to determine specific things about your code. assert equal is sortof a catch all, but there is a long list of assertions that are more specific. essentially, 'assert that x is true' 

### testing equality. 
When we use assert_equal, we are testing for value equality. If we wish to test for being the same object, we can use assert same. 
Assert equal uses the #== method associated with the tested class. If it is a custom class, we need to have defined a #== to tell ruby how to compare the objects. If we dont, ruby will send a specific error message telling us to look there. 

# Core Tools/Packaging Code
Rubygems
- Packeges of code you can download and use in your ruby programs or from the command line.
  - `gem` command governs gems

- Includes Rubocop, Pry, sequel  and rails.
  - Gems are sourced from remote libraries, usually RubyGems library, but sometimes a school or employers library
- Gem install the gems and handles where and how automatically. 
- Gem env shows where gems are installed, which versions they are and what version of ruby is using them
  -ruby versions is the ruby associated with the gem command
  -ruby executable is the location of the ruby command you use with the gems.
  -installation directory shows where the gem is installed by default.
Rbenv
  - Rbenv is a ruby version manager, much like rvm.
  - rbenv's heart is a set of directories that store rubies, associated tools and gems. There are sub directories for each version.
  - Rbenv uses small scripts called shims. The scripts have the same names as the ruby and gem programs, and they live in the shims directory that sits before directories containing rubies and gems.
  - Using commands rbenv searches out and runs the scripts. 


Bundler
- Bundler is a dependency manager.
- Bundler itself is a gem. 

- bundler relies on a textfile `GemFile` to tell what ruby and gems it should use.
  -gemfile uses a dsl that provides details about the ruby and gems needed. A config file
- the bundle install command scans the file and shows all the dependancies. 

```ruby
source 'https://rubygems.org'

ruby '2.3.1'
gem 'sinatra'
gem 'erubis'
gem 'rack'
gem 'rake'
```

when we run the bundle install, we get  a gem file as below
```
GEM
  remote: https://RubyGems.org/
  specs:
    erubis (2.7.0)
    rack (1.6.4)
    rack-protection (1.5.3)
      rack
    rake (10.4.2)
    sinatra (1.4.7)
      rack (~> 1.5)
      rack-protection (~> 1.4)
      tilt (>= 1.3, < 3)
    tilt (2.0.5)

PLATFORMS
  ruby

DEPENDENCIES
  erubis
  rack
  rake
  sinatra

RUBY VERSION
   ruby 2.3.1p112

BUNDLED WITH
   1.13.6
```
- The spec section under the gem heading provides a list of the gems the app will load. beneath each gem is the gem's dependancies ie The gems and version it needs to work. 

- After, add `require 'bundler/setup` to the beggening of the app code, before anything else. (unless the app is a rails app)

- bundler provides a `binstubs` feature if you use this feature you may have add directories to PATH. The gem env and rvm info commands will reflect this. 
  - binstubs is an alternatice to using bunlde exec. It creates a directory of short scripts with the same names as executables installed by gems. the directory is default named bin.
    - this should be overridden if your app needs its own bin directory

- if you cant use bundler/setup you can use bundle exec.
  - it can resolve dependency conflicts

- common(ish) errors that can occur are missing gems in gem.lock file or needing to run bundle exec
  - the wrong version of the bundler command might be another. 
  - the ruby and gems stated might be incompatible versions

Rake

- Rake is a gem that automates common functions required to build, test, package and install programs. Its pre installed in modern rubies. 
  - set up required environments by creating directories and files
  - set up and initialize databases
  - run tests
  - package your application and all of its files for distribution
  - install the application
  - perform common git tasks
  - rebuild certain files and directories based on changes to other files and directories

You can write tasks to automate whatever you want in your application during dev, testing and release.

Rake uses `Rakefile` 
- Rake files contain tasks written in a near-ruby dsl. 

```ruby
desc 'Say hello'
task :hello do
  puts "Hello there. This is the `hello` task."
end

desc 'Say goodbye'
task :bye do
  puts 'Bye now!'
end

desc 'Do everything'
task :default => [:hello, :bye]
``` 
desc defines a short description of the task, appears when when run rake -T

task is a method that associates a name with either a ruby block or a list of dependencies

the final task, default, is run if we do not name a specific task when we invoke rake
  - we run bundle exec rake to run rake commands

example rake file automation
- run all tests associated with the program
- increment the version number
- create you release notes
- make a complete backup of your local repo

Rake can run each as a separate tasks or bundle thing into larger task in any order.


### Purpose of core tools
-
### Gemfiles
-


minitest reporters



testing

multiple class testing, what do 
- solved

passing blocks HOW in detail

- array.each(&block) the & converts the proc object to a block which each then uses
```ruby
def custom_method(&block)
  block.call
end
```
-`custom_method(&block)`
