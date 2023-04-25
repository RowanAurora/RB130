# write a problram that takes an input letter and outputs a diamond based on that letter,
# starting with "a" and going untill the input letter and then back to "a"

#Genereate first line

#geneerate middle line

# Honestly, the solution looks ugly to me and I will be looking at other solutions.
# That said, it works perfect

class Diamond
  def self.make_diamond(input)
    @@result = []
    @@a = ("A"..input).to_a 
    if input == "A"
      first_line.join
    else
      assemble_diamond
    end
  end

  class << self 
      
    def assemble_diamond
      self.first_line
      self.middle_lines_decending
      self.middle_lines_ascending
      self.first_line
      @@result.join
    end

    def first_line
      @@counter_outside = @@a.size - 1
      @@counter_inside = 0
      @@counter = 0
      
      @@result << ((" " * @@counter_outside) + @@a[@@counter] + (" " * @@counter_outside)) + "\n"
    end

    def middle_lines_decending
      @@counter_outside -= 1
      @@counter_inside += 1

      loop do 
        @@counter += 1
        break if @@counter_outside < 0
        @@result << (" " * @@counter_outside) + @@a[@@counter] + (" " * @@counter_inside) + @@a[@@counter] + (" " * @@counter_outside) + "\n"
        @@counter_outside -= 1
        @@counter_inside += 2
      end

      @@counter -= 1
      @@counter_outside += 1
      @@counter_inside -= 2
    end

    def middle_lines_ascending
      loop do
        @@counter -= 1
        @@counter_outside += 1
        @@counter_inside -= 2
        break if @@counter_inside < 1
        @@result << (" " * @@counter_outside) + @@a[@@counter] + (" " * @@counter_inside) + @@a[@@counter] + (" " * @@counter_outside) + "\n"
      end
    end
  end
end
puts Diamond.make_diamond("Z")
