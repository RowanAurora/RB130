items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

# 1
gather(items) do |*food, wheat|
  puts food.join(", ")
  puts wheat
end

# 2
gather(items) do |apple, *food, wheat|
  puts apple
  puts food.join(", ")
  puts wheat
end

# 3
gather(items) do |apple, *food|
  puts apple
  puts food.join(", ")
end

# #4

gather(items) do |apple, corn, cabbage, wheat|
  puts "#{apple}, #{corn}, #{cabbage}, and #{wheat}"
end