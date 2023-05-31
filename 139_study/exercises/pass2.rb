def raptorize(array)
  yield(array)
end

raptorize(%w(raven finch hawk eagle)) do |_, _, *raptors|
  puts raptors
end