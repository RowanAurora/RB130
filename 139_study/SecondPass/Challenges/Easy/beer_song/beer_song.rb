# Unique phrases:
# 2 bottles of beer on the wall, 2 bottles of beer.
# Take one down and pass it around, 1 bottle of beer on the wall.

# 1 bottle of beer on the wall, 1 bottle of beer.
# Take it down and pass it around, no more bottles of beer on the wall.

# No more bottles of beer on the wall, no more bottles of beer.
# Go to the store and buy some more, 99 bottles of beer on the wall.

# prodecudural phrases:
# 46 bottles of beer on the wall, 46 bottles of beer.
# Take one down and pass it around, 45 bottles of beer on the wall.

# start = start
# stop = stop ? stop : start
# (stop..start).to_a.reverse.each do |num|

class BeerSong
  def self.verse(num)
    song = []
    case num
    when 0
      song << "No more bottles of beer on the wall, no more bottles of beer.\n" \
      "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
    when 1
      song << "1 bottle of beer on the wall, 1 bottle of beer.\n" \
      "Take it down and pass it around, no more bottles of beer on the wall.\n"
    when 2
      song << "2 bottles of beer on the wall, 2 bottles of beer.\n" \
      "Take one down and pass it around, 1 bottle of beer on the wall.\n" \
    else 
      song << "#{num} bottles of beer on the wall, #{num} bottles of beer.\n" \
      "Take one down and pass it around, #{num - 1} bottles of beer on the wall.\n"
    end
    song.join("\n")
  end

  def self.verses(start, stop)
   song = []
   start.downto(stop) {|num| song << self.verse(num)}
   song.join("\n")
  end

  def self.lyrics
    self.verses(99, 0)
  end

 end    


puts BeerSong.verses(99, 98)
