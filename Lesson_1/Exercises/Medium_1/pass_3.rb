items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

gather(items) do |*stuff, wheat|
  puts stuff.join(", ")
  puts wheat
end

gather(items) do |apples, *stuff, wheat|
  puts apples
  puts stuff.join(", ")
  puts wheat
end

gather(items) do |a, *b |
  puts a
  puts b.join(", ")
end

gather(items) do |a, b, c, d|
  puts "#{[a, b, c ,d].join(", ")}"
end