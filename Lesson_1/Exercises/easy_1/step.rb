def step(start, ending, step_by)
  while start < ending
    yield(start)
    start += step_by
  end
end

step(1, 10, 3) { |value| puts "value = #{value}" }