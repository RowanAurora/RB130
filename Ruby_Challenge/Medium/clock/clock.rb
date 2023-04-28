# create a clock that is independatn of date

# add or subtract minites from times represented by an object.
# should not mutate clock objects when adding or subtracting minutes
# should be a new clock object

# class methods that return a new clock object
# the Clock#at method returns the new object
# 1st argument represents hour. 2nd is minutes.

# 24  60

# 60 mins = 1 h
# 25h = 0h 

class Clock

  def initialize(hour, minutes)
    @hour = hour
    @minutes = minutes
  end

  def self.at(hour, minutes=00)
    hour, minutes = self.minutes_fixer(hour, minutes)
    
    hour = format("%02d", hour = hour_fixer(hour))
    minutes = format("%02d", minutes)

    Clock.new(hour, minutes)
  end

  def self.hour_fixer(hour)
    loop do
      hour >= 24 ? hour -= 24 : hour
      hour < 00 ? hour += 24 : hour
      break if hour >= 0 && hour < 24
    end
    hour
  end

  def self.minutes_fixer(hour, minutes)
    loop do
      if minutes >= 60
        hour += 1
        minutes -= 60
      elsif minutes < 0
        hour -= 1
        minutes += 60
      end
      break if minutes < 60 && minutes >= 00
    end
    [hour, minutes]
  end

  def +(number)
    Clock.at(@hour.to_i, (@minutes.to_i + number))
  end

  def -(number)
    Clock.at(@hour.to_i, (@minutes.to_i - number))
  end

  def to_s
    "#{@hour}:#{@minutes}"
  end

  def ==(other)
    self.to_s == other.to_s
  end
end

