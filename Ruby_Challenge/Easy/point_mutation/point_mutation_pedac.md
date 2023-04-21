Problem:

# write a program that can calculate the Hamming distance between two dna strands
 - hamming distance is the number of differences between two dna strands. for strands of equal length

```
GAGCCTACTAACGGGAT
CATCGTAATGACGGCCT
^ ^ ^  ^ ^    ^^
```

The hamming distance is 7 here.

- test requirements 
.hamming_distance returns a integer

Compare different lengths of strands based on smaller length

string arguments are passed to hamming_distance, not another dna object.
must compare the string inside the dna object with the argument string
test must not shorten original strand.

examples 

- see testing file.

data structures / notes

- string arguments to compare
  - probably easiest to convert to arrays while comparing
  - compare a slice of longer strand to full smaller strand
      - dont mutate strand
  -return an integer.

- hamming_distance does calculations, so not a simple getter method, unless it calls on another.

DNA class 

dna class has a state that is the dna string.
we compare that state to the argument


Algorithm

Instantiate DNA object
  - DNA object takes one argument, a string
  - save to instance variable @dna_strand
call #.hamming_distance method
  assign 1st strand
    - assign strand1 to @dna_strand broken into character array
  assign strand2 to argument string broken into character array
  find the shorter strand, reassign other strand to a slice of itself appropriately sized -maybe

  iterate through, comparing each current letter
    - create a counting variable, increment if they do not match
    - stop at end of smaller strand 
  return the counting variable

  code:

  see point_mutations.rb



