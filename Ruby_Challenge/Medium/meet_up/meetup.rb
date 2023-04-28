require 'date'
 
# I expect my solution to be a bit odd, I have a lot of trouble with dates/times based things in particular

 class Meetup 
  def initialize(year, month)
   @year = year
   @month = month
  end

  def day(dow, sch)
    period = check_sch(sch.downcase) # generate array of days that could match

    fix_length(period) #ensure proper length in month

    day = day_of_week(dow.downcase, period) # find the number day that corresponds to argument dow

    begin                             #return nil if invalid date
      Date.civil(@year, @month, day)
    rescue
      nil
    end
  end

  def check_sch(sch)
    case sch
    when "first" then (1..7).to_a
    when "second" then (8..14).to_a
    when "third" then (15..21).to_a
    when "fourth" then (22..28).to_a
    when "fifth" then (29..31).to_a
    when "last" then (22..31).to_a.reverse
    when "teenth" then (13..19).to_a
    end
  end


  def day_of_week(dow, period)
    case dow
    when "monday" then period.select {|day| Date.civil(@year, @month, day).monday? }[0]
    when "tuesday" then period.select {|day| Date.civil(@year, @month, day).tuesday? }[0]
    when "wednesday" then period.select {|day| Date.civil(@year, @month, day).wednesday? }[0]
    when "thursday" then period.select {|day| Date.civil(@year, @month, day).thursday? }[0]
    when "friday" then period.select {|day| Date.civil(@year, @month, day).friday? }[0]
    when "saturday" then period.select {|day| Date.civil(@year, @month, day).saturday? }[0]
    when "sunday" then period.select {|day| Date.civil(@year, @month, day).sunday? }[0]
    end
  end

  def fix_length(period)
    if @month == 2 && Date.civil(@year).leap?
      period.select! {|num| num <= 29 }
    elsif @month == 2
      period.select! {|num| num <= 28 }
    elsif [4, 6, 9, 11].include?(@month)
      period.select! {|num| num <= 30 }
    else 
      period
    end
  end
end
