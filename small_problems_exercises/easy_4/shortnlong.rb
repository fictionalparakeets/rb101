# Short Long Short
=begin
Write a method that takes two strings as arguments, determines the longest of the two strings,
and then returns the result of concatenating the shorter string, the longer string, and the shorter 
string once again. You may assume that the strings are of different lengths.
=end

def short_long_short(str1, str2)
  if str1.size > str2.size
    long_string = str1
    short_string = str2
  else
    long_string = str2
    short_string = str1
  end
  concat_string = short_string + long_string + short_string
end

# Tests:
p short_long_short('abc', 'defgh') == "abcdefghabc"
p short_long_short('abcde', 'fgh') == "fghabcdefgh"
p short_long_short('', 'xyz') == "xyz"
