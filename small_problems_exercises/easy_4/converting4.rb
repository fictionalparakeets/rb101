# Convert a Signed Number to a String!
=begin
In the previous exercise, you developed a method that converts non-negative numbers to strings.
In this exercise, you're going to extend that method by adding the ability
to represent negative numbers as well.

Write a method that takes an integer, and converts it to a string representation.

You may not use any of the standard conversion methods available in Ruby,
such as Integer#to_s, String(), Kernel#format, etc. You may, however, use 
integer_to_string from the previous exercise.
=end

# Code from previous exercise:
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

# New code:
=begin
def signed_integer_to_string(number)
  if number < 0
    integer_to_string(-number).prepend('-')
  elsif number > 0
    integer_to_string(number).prepend('+')
  else
    integer_to_string(number)
  end
end
=end


# Solution from exercise:
def signed_integer_to_string(number)
  case number <=> 0
  when -1 then "-#{integer_to_string(-number)}"
  when +1 then "+#{integer_to_string(number)}"
  else         integer_to_string(number)
  end
end

=begin
Explanation:
The expression number <=> 0 may look a bit odd; this is ruby's "spaceship" operator.
It compares the left side against the right side, then returns +1 if the left side
is greater than the right, -1 if the left side is smaller than the right,
and 0 if the values are the same. This is often useful when you need to know
whether a number is positive, negative, or zero.

Alternative answer that reduces the method calls to 1:

def signed_integer_to_string(number)
  return "0" if number == 0
  number.positive? ? sign = "+" : sign = "-"
  sign + integer_to_string(number.abs)
end

*** .abs function returns the absolute value of a number ***
=end

# Tests:
p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0)    == '0'
