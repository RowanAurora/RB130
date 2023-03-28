
# INPUT =	%w(A B C D E F G H I J K L M N O P Q R S T U V W X Y Z a b c d e f g h i j k l m n o p q r s t u v w x y z) + [" ", "-"]
# OUTPUT = %w(N O P Q R S T U V W X Y Z A B C D E F G H I J K L M n o p q r s t u v w x y z a b c d e f g h i j k l m) + [" ", "-"]

# def decrypt(name)
#   replace = name.chars
#   replace.map do |letter|
#     idx = INPUT.index(letter)
#     OUTPUT[idx]
#   end.join
# end

def decrypt(name)
  replace = name.chars
  replace.map { |char| replace_char(char) }.join
end 

def replace_char(char)
  case char
  when 'a'..'m', 'A'..'M' then (char.ord + 13).chr
  when 'n'..'z', 'N'..'Z' then (char.ord - 13).chr
  else char
  end
end


["Nqn Ybirynpr", "Tenpr Ubccre", "Nqryr Tbyqfgvar", "Nyna Ghevat", "Puneyrf Onoontr", "Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv",
"Wbua Ngnanfbss", "Ybvf Unvog", "Pynhqr Funaaba", "Fgrir Wbof", "Ovyy Tngrf", "Gvz Orearef-Yrr", "Fgrir Jbmavnx",
"Xbaenq Mhfr", "Fve Nagbal Ubner", "Zneiva Zvafxl", "Lhxvuveb Zngfhzbgb", "Unllvz Fybavzfxv", "Tregehqr Oynapu"].each do |name|
  p decrypt(name)
end