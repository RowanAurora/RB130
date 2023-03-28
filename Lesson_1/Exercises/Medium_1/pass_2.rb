birds = %w(raven finch hawk eagle)

def masher(array)
  yield(array)
end


masher(birds) do |_, _, *raptors| 
  puts "raptors: #{raptors.join(", ")} "
end