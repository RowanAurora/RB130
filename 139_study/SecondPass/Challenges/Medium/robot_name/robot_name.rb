class Robot
  attr_reader :name

  LETTERS = ("A".."Z").to_a
  NUMBERS = ("0".."9").to_a
  @@names = []

  def initialize
    @name = new_name
    reset
  end

  def reset
    @@names.include?(name) ? @@names.delete(name) : nil
    self.name = new_name
    @@names.include?(name) ? reset : @@names << name
  end

  def new_name
    result = ""
    2.times { result << LETTERS.sample }
    3.times { result << NUMBERS.sample }
    result
  end

  private

  attr_writer :name
end
