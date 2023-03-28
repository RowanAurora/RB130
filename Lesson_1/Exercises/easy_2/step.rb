def step(start, ending, step_by)
  loop do
    yield(start)
    break if start + step_by > ending
    start += step_by
  end
  start
end

p step(1, 10, 3) { |value| puts "value = #{value}" }