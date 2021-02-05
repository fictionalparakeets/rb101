# Convert a Number to a String!
=begin
In the previous two exercises, you developed methods that convert simple numeric
strings to signed Integers. In this exercise and the next, you're going to reverse those methods.

Write a method that takes a positive integer or zero, and converts it to a string representation.

You may not use any of the standard conversion methods available in Ruby, 
such as Integer#to_s, String(), Kernel#format, etc. Your method should do this 
the old-fashioned way and construct the string by analyzing and manipulating the number.
=end



def integer_to_string(number)
  digits = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']
  result = ''
  loop do
    number, remainder = number.divmod(10)
    result.prepend(digits[remainder])
    break if number == 0
  end
  result
end


# Tests:
p integer_to_string(4321) == '4321'
p integer_to_string(0)    == '0'
p integer_to_string(5000) == '5000'
