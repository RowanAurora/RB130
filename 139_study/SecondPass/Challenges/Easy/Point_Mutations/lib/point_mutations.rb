require 'bundler/setup'

# Write a program that calculates the hamming distance
# calculate the differences in the strands, 1 point for each difference
# if different lenghts, go by shorter segment

# Instance Methods needed
# #.hamming_distance
# # initialize

class DNA
  attr_reader :strand1

  def initialize(strand1)
    @strand1 = strand1
  end

  def hamming_distance(strand2)
    point_mutations = 0
    arr = [strand1.chars, strand2.chars].sort_by(&:size)
    arr[0].each_with_index do |nuc, idx|
      point_mutations += 1 unless nuc == arr[1][idx]
    end
    point_mutations
  end
end
