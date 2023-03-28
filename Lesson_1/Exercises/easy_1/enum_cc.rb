class Tree
  include Enumerable

  def each;end
  def <=>; end
end

Tree.new.each { |b| nil}
Tree.new.all? {}