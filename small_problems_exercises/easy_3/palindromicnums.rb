# Palindromic Numbers
# Write a mehtod that returns true if its integer argument is palindromic, false otherwise.
# A palindromic number reas the same forwards as backwards.

# Borrowed from previous exercise:
def palindrome?(string)
  string == string.reverse
end

# New code:
def palindromic_number?(num)
  palindrome?(num.to_s)
end

# Tests:
p palindromic_number?(34543) == true
p palindromic_number?(123210) == false
p palindromic_number?(22) == true
p palindromic_number?(5) == true