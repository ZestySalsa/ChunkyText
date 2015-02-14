require_relative "ChunkyText/version"
require_relative "ChunkyText/chunker" 




#
#  get the first 140 characters
#  find the location of the last punctuation mark
#  save all characters from that puncuation mark to the beging of the string to a variable
#  save that variable to the end of a "chunks" array
#  remove the characters from the input string
#  repeat the process untill the input string is empty
#  return the "chunks" array
#  
#  if any neighboring elements in the array add up to 140 chars or less, then merge them together
