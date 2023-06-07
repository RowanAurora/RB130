class SumOfMultiples
  def initialize(*set)
   @set = if set.empty?
            [3, 5]
          else
            set
          end
  end

  def self.to(top_number)
    self.new.to(top_number)
  end

  def to(top_number)
    result = []
    1.upto(top_number - 1) do |num|
      @set.each do |ref|
        if num % ref == 0
          result << num
        end
      end
    end
    result.uniq.sum
  end
end