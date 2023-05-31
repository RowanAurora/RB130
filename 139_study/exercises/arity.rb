# # Group 1
# my_proc = proc { |thing| puts "This is a #{thing}." }
# puts my_proc
# puts my_proc.class
# my_proc.call
# my_proc.call('cat')
=begin
As seen here, procs have lenient arity. my_proc.call works with no arguments, or an argument and would work with more.
This flexibility in accepting arguments is lenient arity.
=end

# # Group 2
# my_lambda = lambda { |thing| puts "This is a #{thing}." }
# my_second_lambda = -> (thing) { puts "This is a #{thing}." }
# puts my_lambda  #<Proc:0x000000013e10ac40 arity.rb:13 (lambda)>
# puts my_second_lambda #<Proc:0x000000013e10abf0 arity.rb:14 (lambda)>
# puts my_lambda.class # Proc
# my_lambda.call('dog') # This is a dog.
# my_lambda.call # error
# my_third_lambda = Lambda.new { |thing| puts "This is a #{thing}." } # error

=begin
Based on the output and return values, we can see that lambdas are a type or proc object.
Lambdas have strict arity, as we can see on line 19. Lambdas are a varient object in the proc class, 
not a class on its own as we can see when we try to initialize on line 20
=end

# Group 3
# def block_method_1(animal)
#   yield
# end

# block_method_1('seal') { |seal| puts "This is a #{seal}."}
# block_method_1('seal')

=begin
Blocks appear to have lenient arity, as you can pass them less or more arguments and they wont complain.
In the context on the method however, methods have strict arity. Yield requires there to be a block, which is why
with optional blocks we tend to put them behind #block_given? to avoid the error.

Also, no argument is passed to this block. we would need to have `yield(animal) if block_given?` for all
code to work as it seems to be intended

=end

# # Group 4
def block_method_2(animal)
  yield(animal)
end

block_method_2('turtle') { |turtle| puts "This is a #{turtle}."} # This is a turtle.
block_method_2('turtle') do |turtle, seal|
  puts "This is a #{turtle} and a #{seal}."
end                                               #This is a turtle and a .
block_method_2('turtle') { puts "This is a #{animal}."}
=begin
These sequence shows both strict and lenient arity. with blocks, we have lenient arity. We can have
and extra parameter that does not have a value passed from yield, and will be nil, and this will appear blank.
when we try to intepolate animal, however, we can see that there is strict arity hapening. in intepolation, methods 
  are automatically called on the interpolated object. If that object does not exists at all, this will cause
  an error.

=end

This exercise is a demonstration of arity. we can surmise that Blocks and Procs have lenient arity,
and lambdas(which are a subtype of procs) and methods have strict arity. Strict arity meaning the number of arguments must be specified
and lenient meneaning that there is flexibility in how many arguments are required.