class DNA
  
  def initialize(dna_strand)
    @dna_strand = dna_strand
  end
  
  def hamming_distance(second_strand)
    strand1 = dna_strand.chars
    strand2 = second_strand.chars
    
    arr = [strand1, strand2].sort_by { |array| array.size }
    
    count_points(arr)
  end
  
  private
  
  attr_reader :dna_strand

  def count_points(arr)
    counter = 0
    point_mutations = 0
    arr.first.each do |nuc|
      (nuc == arr[1][counter]) ? nil : (point_mutations += 1)
      counter += 1
    end
    point_mutations
  end
end 

p DNA.new('aaaa').hamming_distance('aaabfdgdfgg')