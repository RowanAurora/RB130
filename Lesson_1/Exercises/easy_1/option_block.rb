def blocking_block(str)
   if block_given?  
    yield(str)
   else
    puts "BINGO"
   end
end

blocking_block("heyyyy") { |str| puts str }
blocking_block("hey")