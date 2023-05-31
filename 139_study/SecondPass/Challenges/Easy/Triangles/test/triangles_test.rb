require 'simplecov'
SimpleCov.start
require 'bundler/setup'


require 'minitest/autorun'
require 'minitest/reporters'
MiniTest::Reporters.use!

require_relative '../lib/triangles'

puts "woof"
class TrianglesTest < MiniTest::Test

end