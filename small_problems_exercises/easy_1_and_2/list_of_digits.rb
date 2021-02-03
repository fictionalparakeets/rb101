# Write a method that takes one argument, a positive integer, 
# and returns a list of the digits in the number.

def digit_list(input)
  input.to_s.chars.map { |x| x.to_i }
end

p digit_list(12345)

puts digit_list(12345) == [1, 2, 3, 4, 5]

# Can modify the map method to enumerable map "...map(&:to_i)"

