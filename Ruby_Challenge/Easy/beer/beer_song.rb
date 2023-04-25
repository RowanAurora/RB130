# write a program that can generate the lyrics to the beer song

# requires class #verse method which takes a number as input and uses that as a starting point for the song.
# verse only returns the verse of the number given

# requires a class #lyrics method that returns the whole song starting at 99 and ending at "No more" whne zero

class BeerSong

  def self.verse(number)
    return case_number(number) if number == 0 
    case_number(number)
  end

  def self.verses(*number)
    song = []
    number.max.downto(number.min) { |num| song << case_number(num)}
    song.join("\n")
  end

  def self.lyrics
    self.verses(99,0)
  end

  class << self

    private

    def case_number(number)
      case number
      when 2
        "#{number} bottles of beer on the wall, #{number} bottles of beer.\n"\
        "Take one down and pass it around, 1 bottle of beer on the wall.\n"
        
      when 1 
        "#{number} bottle of beer on the wall, #{number} bottle of beer.\n"\
        "Take it down and pass it around, no more bottles of beer on the wall.\n"
        
      when 0
        "No more bottles of beer on the wall, no more bottles of beer.\n"\
        "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
      else
        "#{number} bottles of beer on the wall, #{number} bottles of beer.\n"\
        "Take one down and pass it around, #{number - 1} bottles of beer on the wall.\n"
        
      end
    end

  end
end

puts BeerSong.verses(2, 0)