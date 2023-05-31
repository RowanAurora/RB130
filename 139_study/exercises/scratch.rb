def test2(block)
  block.call("meow")
end

def cats(&block)
  %i(1 2 3).each &block
  test2(block)
end

a = proc { |item| puts " a #{item}" }

dog = cats(&a)

