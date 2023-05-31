def cats(arg)
  proc { puts arg}
end

b = cats("woof")
b.call
