# Palindromic Strings (Part 2)
=begin
Write another method that returns true if the string passed as an argument is a palindrome, 
false otherwise. This time, however, your method should be case-insensitive, 
and it should ignore all non-alphanumeric characters. If you wish, you may simplify things 
by calling the palindrome? method you wrote in the previous exercise.
=end

# From previous exercise:
def palindrome?(string)
  string == string.reverse
end

# New code:
def real_palindrome?(string)
  cleaned_string = string.downcase
  cleaned_string = cleaned_string.split('').keep_if { |letter| letter =~ /[a-z0-9]/ }.join('')
  palindrome?(cleaned_string)
end

# Tests:
p real_palindrome?('madam') == true
p real_palindrome?('Madam') == true           # (case does not matter)
p real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
p real_palindrome?('356653') == true
p real_palindrome?('356a653') == true
p real_palindrome?('123ab321') == false


# Alternative method (this was the listed solution):
def real_palindrome?(string)
  string = string.downcase.delete('^a-z0-9')
  palindrome?(string)
end
