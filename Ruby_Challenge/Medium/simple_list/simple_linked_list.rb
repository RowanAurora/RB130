class Element
  attr_reader :datum, :next # accesor methods for datum and next

  def initialize(datum, next_element = nil) #mandatory datum argument, default nil for next element
    @datum = datum # always something
    @next = next_element #something or nil. object always has 2 states
  end

  def tail?
    @next.nil? #true if nil, false if not. 
  end

end

class SimpleLinkedList
  attr_reader :head #head accessor method

  def empty? #checks if @head is nil
    @head.nil?
  end

  def size #
    size = 0
    current_element = @head
    while(current_element)
      size += 1
      current_element = current_element.next
    end
    size
  end

  def peek #return the object head if it exists and is not nil nil
    @head.datum if @head
  end

  def push(datum) # push takes the number argument and the current @head and makes head a new Element object
    element = Element.new(datum, @head) # Always only 2 elements, or 1 and nil
    @head = element #essentially a 2 element array
  end

  def pop #throws error if empty because of next method. must be Element or integer
    datum = peek 
    @head = @head.next
    datum
  end

  def to_a
    array = [] #blank array
    current_element = head #current element is Element object
    while !current_element.nil? #while that object is not nil
      array.push(current_element.datum) #array push the number or nil
      current_element = current_element.next # will generate nil and then break
    end
    array #returns populated array
  end

  def reverse
    list = SimpleLinkedList.new #create a new list object
    current_element = head # use current element object
    while !current_element.nil? #until object is nil
      list.push(current_element.datum) #goes through numbers in normal order which stacks them in reverse here
      current_element = current_element.next #goes untill nil
    end
    list # returns list object
  end

  def self.from_a(array)
    array = [] if array.nil? #generates blank array if input is nil

    list = SimpleLinkedList.new #new list object
    array.reverse_each { |datum| list.push(datum) } #reverse the array and push each item
    list #return list object.
  end

end


