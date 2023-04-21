# def url?(str)
#  p str.match?(/^https?:\/\/\w*.com$/)
# end

# url?('http://launchschool.com')   # -> true
# url?('https://example.com')       # -> true
# url?('https://example.com hello') # -> false
# url?('   https://example.com')    # -> false


# def fields(str)
#  p str.split(/[ \t,]+/) # spaces, tabs and commas, but not newline
# end

#  fields("Pete,201,Student")
# # -> ["Pete", "201", "Student"]

# fields("Pete \t 201    ,  TA")
# # -> ["Pete", "201", "TA"]

# fields("Pete \t 201")
# # -> ["Pete", "201"]

# fields("Pete \n 201")
# # -> ["Pete", "\n", "201"]

# def mystery_math(str) #first
#   p str.sub(/[\*|\+|\-|\/]/, '?')
# end

# def mystery_math(str) #all
#   p str.gsub(/[\*|\+|\-|\/]/, '?')
# end

# mystery_math('4 + 3 - 5 = 2')
# # -> '4 ? 3 - 5 = 2'

# mystery_math('(4 * 3 + 2) / 7 - 1 = 1')
# # -> '(4 ? 3 + 2) / 7 - 1 = 1'

# def danish(str)
#   p str.sub(/\b(apple|blueberry|cherry)\b/, 'danish')
# end
# danish('An apple a day keeps the doctor away')
# # -> 'An danish a day keeps the doctor away'

# danish('My favorite is blueberry pie')
# # -> 'My favorite is danish pie'

# danish('The cherry of my eye')
# # -> 'The danish of my eye'

# danish('apple. cherry. blueberry.')
# # -> 'danish. cherry. blueberry.'

# danish('I love pineapple')
# # -> 'I love pineapple'

# def format_date(str)
#   p str.sub(/\A(\d\d\d\d)-(\d\d)-(\d\d)$/, '\3.\2.\1') # Interesting mechanism, 1 indexed capture groups
# end
# format_date('2016-06-17') # -> '17.06.2016'
# format_date('2016/06/17') # -> '2016/06/17' (no change)

# def format_date(str)
#   p str.sub(/\A(\d\d\d\d)(-|\/)(\d\d)(-|\/)(\d\d)$/, '\5.\3.\1') 
# end

# def format_date(str)
#   p str.sub(/\A(\d\d\d\d)-(\d\d)-(\d\d)$/, '\3.\2.\1') 
#        .sub(/\A(\d\d\d\d)\/(\d\d)\/(\d\d)$/, '\3.\2.\1') 
# end

# format_date('2016-06-17') # -> '17.06.2016'
# format_date('2017/05/03') # -> '03.05.2017'
# format_date('2015/01-31') # -> '2015/01-31' (no change)

def change_stuff(str, reg)
  p str.gsub(reg, "zoot")
end


b = Regexp.new('wow')
change_stuff('wow', b)