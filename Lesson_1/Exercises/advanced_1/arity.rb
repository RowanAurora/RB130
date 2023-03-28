# my_proc = proc { |thing| puts "This is a #{thing}." }
# puts my_proc
# puts my_proc.class
# my_proc.call
# my_proc.call('cat')

#<Proc:0x000000013005b190 arity.rb:1> - The 'object', result of puts my_proc
# Proc - Output of my_proc.class, is just the class
# THis is a . - Output of my_proc.class with no argument, #{thing} is blank
# This is a cat. - Output of my_proc.class with argument 'cat', thing becomes cat. 

# call arguments become parameters

# my_lambda = lambda { |thing| puts "This is a #{thing}." }
# my_second_lambda = -> (thing) { puts "This is a #{thing}." }
# puts my_lambda # Proc object
# puts my_second_lambda # Proc object
# puts my_lambda.class # Proc? huh. 
# my_lambda.call('dog') # This is a dog. 
# # my_lambda.call # Error
# my_third_lambda = Lambda.new { |thing| puts "This is a #{thing}." } # Error, no Lamda constant 

# def block_method_1(animal)
#   yield
# end

# block_method_1('seal') { |seal| puts "This is a #{seal}."} # This is a.
# block_method_1('seal')  #error

def block_method_2(animal)
  yield(animal)
end

block_method_2('turtle') { |turtle| puts "This is a #{turtle}."} #this is a turtle
block_method_2('turtle') do |turtle, seal|
  puts "This is a #{turtle} and a #{seal}."
end                                         # This is a turtle and a .
block_method_2('turtle') { puts "This is a #{animal}."} #error

# The ones that printed #this is my . have lenient arity the others are strict
# block and procs have lenient, methods and lamdas have strict.