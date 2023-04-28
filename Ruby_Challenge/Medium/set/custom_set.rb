class CustomSet

  def initialize(arr=[])
    @arr = arr.uniq.sort
  end

  def empty? #contains no states
    arr.empty?
  end

  def contains?(item) #state has argument value?
    arr.include?(item)
  end

  def subset?(set_obj) #caller state has less value than argument state
    self.arr.all? { |num| set_obj.arr.include?(num)}
  end

  def disjoint?(set_obj) # states dont overlap
    self.arr.all? { |num| !set_obj.arr.include?(num)}
  end

  def eql?(set_obj) #states contain same values as argument state
    self == set_obj
  end

  def add(num) # add argument to state, Keeps uniq property though
    @arr << num
    self.arr = self.arr.sort.uniq
    self
  end

  def intersection(other) # only keep overlapping arguments state
    self.arr = self.arr.intersection(other.arr)
    self
  end

  def difference(other) # keep all except those contained inarguments state
    self.arr = self.arr - other.arr
    self
  end

  def union(other) # keep uniq states
    self.arr = self.arr + other.arr
    CustomSet.new(arr)
  end

  def ==(other)
    @arr == other.arr
  end

  protected

  attr_accessor :arr
end
