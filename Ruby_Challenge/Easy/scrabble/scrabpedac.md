Create a program that tallies scrabble scores according to point value chart

Letter  	Value
A, E, I, O, U, L, N, R, S, T	1
D, G	                        2
B, C, M, P	                  3
F, H, V, W, Y	                4
K	                            5
J, X	                        8
Q, Z	                        10

Program doesint raise error at non letter input, or nil but returns 0

Needs a score instance method and a class method
  - class method can likely just instantiate and call the instance method or vice versa. 

How to reference letters to scores 
  - a hash with each letter as key and score as value (a slog, too long?)
    -if we iterate through with each we dont need to call by using the array
  - nested array of [ [ ['letters'], score], [['letters], score]] (also arduous)

Letters are case insensitive 