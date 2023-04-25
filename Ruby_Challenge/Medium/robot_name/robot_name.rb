# write a program that assigns a random name to a robot that is 2 letters followed by 3 numbers
# robot names arew random and have a risk of collision and must be prevented. No robots should share a name
# class must have a reset method that renames the robot.

class Robot
  attr_reader :name
  LETTERS = ("A".."Z").to_a
  NUMBERS = ("0".."9").to_a 
  @@names_bank = []

  def initialize
    @name = new_name
  end

  def new_name 
    collecting = []
    loop do
      collecting = []
      2.times { collecting << LETTERS.sample}
      3.times { collecting << NUMBERS.sample}
      collecting = collecting.join
      break unless @@names_bank.include?(collecting)
    end
    @@names_bank << collecting
    collecting
  end

  def reset
    @@names_bank.delete(name)
    @name = new_name
  end
end

